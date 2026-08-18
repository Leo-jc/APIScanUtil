"""Convert CSV files to JSON.

Usage:
    python csv_to_json.py <csv_file> [<csv_file> ...]
    python csv_to_json.py --dir <directory>   # convert all *.csv recursively
"""
import csv
import json
import os
import sys


def _resolve_hyperlink(value: str) -> str:
    """Convert Excel =HYPERLINK("url","label") formula to 'label (url)' plain text.

    Leaves non-formula values untouched.
    """
    v = value.strip()
    if not v.startswith("=HYPERLINK("):
        return value
    inner = v[len("=HYPERLINK("):].rstrip()
    if inner.endswith(")"):
        inner = inner[:-1]
    try:
        parts = list(csv.reader([inner], skipinitialspace=True))[0]
    except Exception:
        return value
    parts = [p for p in parts if p != ""]
    if len(parts) == 2:
        url, label = parts
        return f"{label} ({url})" if label else url
    if len(parts) == 1:
        return parts[0]
    return value


def csv_to_json(csv_path: str) -> str:
    """Convert one CSV file to a sibling .json file. Return the JSON path."""
    # utf-8-sig strips a leading BOM if present.
    with open(csv_path, "r", encoding="utf-8-sig", newline="") as f:
        reader = csv.reader(f)
        rows = list(reader)

    if not rows:
        json_path = csv_path[:-4] + ".json" if csv_path.lower().endswith(".csv") else csv_path + ".json"
        with open(json_path, "w", encoding="utf-8") as out:
            json.dump([], out, ensure_ascii=False, indent=2)
        return json_path

    header = rows[0]
    data = []
    for row in rows[1:]:
        if not row or all(c.strip() == "" for c in row):
            continue  # skip blank lines
        # Pad short rows so every header key gets a value.
        if len(row) < len(header):
            row = row + [""] * (len(header) - len(row))
        record = {}
        for key, val in zip(header, row):
            record[key] = _resolve_hyperlink(val)
        data.append(record)

    json_path = csv_path[:-4] + ".json" if csv_path.lower().endswith(".csv") else csv_path + ".json"
    with open(json_path, "w", encoding="utf-8") as out:
        json.dump(data, out, ensure_ascii=False, indent=2)
    return json_path


def find_csvs(directory: str):
    matches = []
    for root, _dirs, files in os.walk(directory):
        for name in files:
            if name.lower().endswith(".csv"):
                matches.append(os.path.join(root, name))
    return matches


def main(argv):
    args = argv[1:]
    if not args:
        print(__doc__)
        return 1

    if args[0] == "--dir":
        if len(args) < 2:
            print("Error: --dir requires a directory argument", file=sys.stderr)
            return 1
        files = find_csvs(args[1])
    else:
        files = args

    if not files:
        print("No CSV files found.", file=sys.stderr)
        return 1

    exit_code = 0
    for csv_path in files:
        if not os.path.isfile(csv_path):
            print(f"Skip (not a file): {csv_path}", file=sys.stderr)
            exit_code = 1
            continue
        try:
            out = csv_to_json(csv_path)
            print(f"OK   {csv_path}  ->  {out}")
        except Exception as e:  # noqa: BLE001
            print(f"FAIL {csv_path}: {e}", file=sys.stderr)
            exit_code = 1
    return exit_code


if __name__ == "__main__":
    sys.exit(main(sys.argv))
