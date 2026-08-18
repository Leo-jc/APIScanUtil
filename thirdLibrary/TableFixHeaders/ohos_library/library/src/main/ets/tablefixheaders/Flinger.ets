/*
 * Copyright (c) 2026. TableFixHeaders HarmonyOS Adaptation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

const ZERO_SCROLL: number = 0;
const DECELERATION_RATE: number = 62500.0 / 216.0;
const INFLEXION: number = 0.35;
const SCROLL_FRICTION: number = 0.015;
const PPI: number = 160.0 * 39.37 * SCROLL_FRICTION;

export class Flinger {
  private isFlinging: boolean = false;
  private startX: number = ZERO_SCROLL;
  private startY: number = ZERO_SCROLL;
  private minX: number = ZERO_SCROLL;
  private minY: number = ZERO_SCROLL;
  private maxX: number = ZERO_SCROLL;
  private maxY: number = ZERO_SCROLL;
  private currX: number = ZERO_SCROLL;
  private currY: number = ZERO_SCROLL;
  private startTime: number = ZERO_SCROLL;
  private duration: number = ZERO_SCROLL;
  private distanceX: number = ZERO_SCROLL;
  private distanceY: number = ZERO_SCROLL;

  public start(
    initX: number, initY: number,
    initialVelocityX: number, initialVelocityY: number,
    maxScrollX: number, maxScrollY: number
  ): void {
    this.isFlinging = true;
    this.startX = initX;
    this.startY = initY;
    this.minX = ZERO_SCROLL;
    this.minY = ZERO_SCROLL;
    this.maxX = maxScrollX;
    this.maxY = maxScrollY;
    this.currX = initX;
    this.currY = initY;

    const durationX: number = this.getSplineFlingDuration(initialVelocityX);
    const durationY: number = this.getSplineFlingDuration(initialVelocityY);
    this.duration = Math.max(durationX, durationY);

    if (this.duration <= ZERO_SCROLL) {
      this.isFlinging = false;
      return;
    }

    const distX: number = this.getSplineFlingDistance(initialVelocityX);
    const distY: number = this.getSplineFlingDistance(initialVelocityY);

    const targetX: number = Math.max(this.minX,
      Math.min(initX - Math.sign(initialVelocityX) * distX, this.maxX));
    const targetY: number = Math.max(this.minY,
      Math.min(initY - Math.sign(initialVelocityY) * distY, this.maxY));

    this.distanceX = targetX - this.startX;
    this.distanceY = targetY - this.startY;
    this.startTime = Date.now();
  }

  private getSplineFlingDuration(velocity: number): number {
    const absV: number = Math.abs(velocity);
    if (absV < 1) {
      return ZERO_SCROLL;
    }
    const l: number = Math.log(INFLEXION * absV / PPI);
    const decelMinusOne: number = DECELERATION_RATE - 1.0;
    return Math.round(1000.0 * Math.exp(l / decelMinusOne));
  }

  private getSplineFlingDistance(velocity: number): number {
    const absV: number = Math.abs(velocity);
    if (absV < 1) {
      return ZERO_SCROLL;
    }
    const l: number = Math.log(INFLEXION * absV / PPI);
    const decelMinusOne: number = DECELERATION_RATE - 1.0;
    return PPI * Math.exp((DECELERATION_RATE / decelMinusOne) * l);
  }

  public computeStep(): number[] {
    if (!this.isFlinging) {
      return [ZERO_SCROLL, ZERO_SCROLL];
    }

    const oldX: number = this.currX;
    const oldY: number = this.currY;
    const elapsed: number = Date.now() - this.startTime;

    if (elapsed >= this.duration) {
      this.isFlinging = false;
      this.currX = Math.max(this.minX, Math.min(this.startX + this.distanceX, this.maxX));
      this.currY = Math.max(this.minY, Math.min(this.startY + this.distanceY, this.maxY));
      return [oldX - this.currX, oldY - this.currY];
    }

    const t: number = elapsed / this.duration;
    const splineT: number = this.getSplineInterpolation(t);

    this.currX = Math.max(this.minX,
      Math.min(this.startX + this.distanceX * splineT, this.maxX));
    this.currY = Math.max(this.minY,
      Math.min(this.startY + this.distanceY * splineT, this.maxY));

    return [oldX - this.currX, oldY - this.currY];
  }

  private getSplineInterpolation(t: number): number {
    const f: number = t - 1.0;
    return f * f * f * f * f + 1.0;
  }

  public forceFinished(): void {
    this.isFlinging = false;
  }

  public isFinished(): boolean {
    return !this.isFlinging;
  }
}
