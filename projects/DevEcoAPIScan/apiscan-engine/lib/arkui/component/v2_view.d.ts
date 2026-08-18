/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

/**
 *
 * This file includes only framework internal classes and functions
 * non are part of SDK. Do not access from app.
 *
 * Implementation of @ComponentV2 is ViewV2
 * When transpiling @ComponentV2, the transpiler generates a class that extends from ViewV2.
 *
 */

abstract class ViewV2 extends PUV2ViewBase implements IView {

    constructor(parent: IView, elmtId: number = UINodeRegisterProxy.notRecordingDependencies, extraInfo: ExtraInfo = undefined)

    onGlobalThemeChanged(): void

    private onWillApplyThemeInternally(): void

    onWillApplyTheme(theme: Theme): void

    /**
     * The `freezeState` parameter determines whether this @ComponentV2 is allowed to freeze, when inactive
     * Its called with value of the `freezeWhenInactive` parameter from the @ComponentV2 decorator,
     * or it may be called with `undefined` depending on how the UI compiler works.
     *
     * @param freezeState Only the value `true` will be used to set the freeze state,
     * otherwise it inherits from its parent instance if its freezeState is true
     */
    protected finalizeConstruction(freezeState?: boolean | undefined): void

    public debugInfo__(): string

    protected get isViewV2(): boolean

    /**
     * Virtual function implemented in ViewPU and ViewV2
     * Unregisters and purges all child elements associated with the specified Element ID in ViewV2.
     *
     * @param rmElmtId - The Element ID to be purged and deleted
     * @returns {boolean} - Returns `true` if the Element ID was successfully deleted, `false` otherwise.
     */
    public purgeDeleteElmtId(rmElmtId: number): boolean


    // super class will call this function from
    // its aboutToBeDeleted implementation
    protected aboutToBeDeletedInternal(): void

    public initialRenderView(): void

    public observeComponentCreation2(compilerAssignedUpdateFunc: UpdateFunc, classObject: {
        prototype: Object,
        pop?: () => void
    }): void

    /**
     *
     * @param paramVariableName
     * @param @once paramVariableName
     * @param is read only, therefore, init from parent needs to be done without
     *        causing property setter() to be called
     * @param newValue
     */
    protected initParam<Z>(paramVariableName: string, newValue: Z): void

    /**
     *
     * @param paramVariableName
     * @param @once paramVariableName
     * @param is read only, therefore, update from parent needs to be done without
     *        causing property setter() to be called
     * @param @once reject any update
     * @param newValue
     */
    protected updateParam<Z>(paramVariableName: string, newValue: Z): void

    private checkIsV1Proxy<Z>(paramVariableName: string, value: Z): void

    /**
     *  inform that UINode with given elmtId needs rerender
     *  does NOT exec @Watch function.
     *  only used on V2 code path from ObserveV2.fireChange.
     *
     * FIXME will still use in the future?
     */
    public uiNodeNeedUpdateV2(elmtId: number): void


    /**
     * For each recorded dirty Element in this custom component
     * run its update function
     *
     */
    public updateDirtyElements(): void


    public UpdateElement(elmtId: number): void

    /**
     * Retrieve child by given id
     * @param id
     * @returns child if child with this id exists and it is instance of ViewV2
     */
    public getViewV2ChildById(id: number): ViewV2 | undefined

    // WatchIds that needs to be fired later gets added to monitorIdsDelayedUpdate
    // monitor fireChange will be triggered for all these watchIds once this view gets active
    public addDelayedMonitorIds(watchId: number): void

    public addDelayedComputedIds(watchId: number): void

    public setActiveInternal(active: boolean): void

    private performDelayedUpdate(): void

    /*
      findProvidePU finds @Provided property recursively by traversing ViewPU's towards that of the UI tree root @Component:
      if 'this' ViewPU has a @Provide('providedPropName') return it, otherwise ask from its parent ViewPU.
      function needed for mixed @Component and @ComponentV2 parent child hierarchies.
    */
    public findProvidePU(providedPropName: string): ObservedPropertyAbstractPU<any> | undefined

    get localStorage_(): LocalStorage

    /**
     * @function observeRecycleComponentCreation
     * @description custom node recycle creation not supported for V2. So a dummy function is implemented to report
     * an error message
     * @param name custom node name
     * @param recycleUpdateFunc custom node recycle update which can be converted to a normal update function
     * @return void
     */
    public observeRecycleComponentCreation(name: string, recycleUpdateFunc: RecycleUpdateFunc): void




    /**
     * on first render create a new Instance of Repeat
     * on re-render connect to existing instance
     * @param arr
     * @returns
     */
    public __mkRepeatAPI: <I>(arr: Array<I>) => RepeatAPI<I>
}
