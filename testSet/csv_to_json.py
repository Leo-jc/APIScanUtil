# -*- coding: utf-8 -*-
"""Convert all .csv files under testSet to .json, parsing =HYPERLINK formulas."""
import csv
import json
import re
from pathlib import Path

# match: =HYPERLINK("url","title")  — the two-arg Excel formula
HYPERLINK_RE = re.compile(r'^=HYPERLINK\(\s*"([^"]*)"\s*,\s*"([^"]*)"\s*\)$')


def parse_hyperlink(cell: str) -> dict:
    """Return {'url':..., 'title':...} when cell is a HYPERLINK formula, else {'title': cell}."""
    cell = (cell or "").strip()
    m = HYPERLINK_RE.match(cell)
    if m:
        return {"url": m.group(1), "title": m.group(2)}
    return {"title": cell}


def convert(csv_path: Path) -> tuple[Path, int]:
    with csv_path.open("r", encoding="utf-8-sig", newline="") as f:
        reader = csv.reader(f)
        rows = list(reader)
    if not rows:
        return csv_path, 0
    header = rows[0]
    records = []
    for row in rows[1:]:
        if not any(field.strip() for field in row):
            continue
        # pad short rows
        while len(row) < len(header):
            row.append("")
        record = {}
        for i, key in enumerate(header):
            value = row[i]
            if key == "标题":
                record[key] = parse_hyperlink(value)
            else:
                record[key] = value
        records.append(record)
    json_path = csv_path.with_suffix(".json")
    with json_path.open("w", encoding="utf-8") as f:
        json.dump(records, f, ensure_ascii=False, indent=2)
    return json_path, len(records)


def main():
    root = Path(__file__).resolve().parent
    csv_files = sorted(root.rglob("*.csv"))
    print(f"Found {len(csv_files)} csv file(s):")
    total = 0
    for csv_path in csv_files:
        json_path, count = convert(csv_path)
        rel = json_path.relative_to(root)
        print(f"  {csv_path.relative_to(root)}  ->  {rel}  ({count} records)")
        total += count
    print(f"Done. {total} record(s) across {len(csv_files)} file(s).")


if __name__ == "__main__":
    main()
