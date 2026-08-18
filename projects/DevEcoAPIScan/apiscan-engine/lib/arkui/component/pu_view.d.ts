/*
 * Copyright (c) 2022-2024 Huawei Device Co., Ltd.
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
 *
 *  * ViewPU - View for Partial Update
 *
* all definitions in this file are framework internal
*/
abstract class ViewPU extends PUV2ViewBase
    implements IViewPropertiesChangeSubscriber, IView {

    protected obtainOwnObservedProperties(): void

    public get localStorage_(): LocalStorage

    public set localStorage_(instance: LocalStorage)

    // FIXME
    // indicate if this is  V1 or a V2 component
    // V1 by default, changed to V2 by the first V2 decorated variable
    // when splitting ViewPU and ViewV2
    // use instanceOf. Until then, this is a workaround.
    // @Local, @Param, @Trace, etc V2 decorator functions modify isViewV2 to return true
    // (decorator can modify functions in prototype)
    // FIXME
    protected get isViewV2(): boolean

    /**
     * Create a View
     *
     * 1. option: top level View, specify
     *    - compilerAssignedUniqueChildId must specify
     *    - parent=undefined
     *    - localStorage  must provide if @LocalSTorageLink/Prop variables are used
     *      in this View or descendant Views.
     *
     * 2. option: not a top level View
     *    - compilerAssignedUniqueChildId must specify
     *    - parent must specify
     *    - localStorage do not specify, will inherit from parent View.
     *
     */
    constructor(parent: IView, localStorage: LocalStorage, elmtId: number = UINodeRegisterProxy.notRecordingDependencies, extraInfo: ExtraInfo = undefined)

    onGlobalThemeChanged(): void

    // inform the subscribed property
    // that the View and thereby all properties
    // are about to be deleted
    abstract aboutToBeDeleted(): void;

    aboutToReuse(params: Object): void

    aboutToRecycle(): void

    onWillApplyTheme(theme: Theme): void

    // super class will call this function from
    // its aboutToBeDeleted implementation
    protected aboutToBeDeletedInternal(): void

    public purgeDeleteElmtId(rmElmtId: number): boolean

    protected purgeVariableDependenciesOnElmtIdOwnFunc(elmtId: number): void

    /**
     * Indicate if this @Component is allowed to freeze by calling with freezeState=true
     * Called with value of the @Component decorator 'freezeWhenInactive' parameter
     * or depending how UI compiler works also with 'undefined'
     * @param freezeState only value 'true' will be used, otherwise inherits from parent
     * if not parent, set to false.
     */
    protected initAllowComponentFreeze(freezeState: boolean | undefined): void

    /**
     * ArkUI engine will call this function when the corresponding CustomNode's active status change.
     * ArkUI engine will not recurse children nodes to inform the stateMgmt for the performance reason.
     * So the stateMgmt needs to recurse the children although the isCompFreezeAllowed is false because the children nodes
     * may enable the freezeWhenInActive.
     * @param active true for active, false for inactive
     */
    public setActiveInternal(active: boolean): void


    // abstract functions to be implemented by application defined class / transpiled code
    protected abstract purgeVariableDependenciesOnElmtId(removedElmtId: number);

    protected abstract initialRender(): void;

    protected abstract rerender(): void;

    public abstract updateRecycleElmtId(oldElmtId: number, newElmtId: number): void;

    public abstract updateStateVars(params: Object);

    public initialRenderView(): void

    public UpdateElement(elmtId: number): void

    public delayCompleteRerender(deep: boolean = false): void

    public flushDelayCompleteRerender(): void

    /**
     * force a complete rerender / update on specific node by executing update function.
     *
     * @param elmtId which node needs to update.
     *
     * framework internal functions, apps must not call
     */
    public forceRerenderNode(elmtId: number): void

    // implements IMultiPropertiesChangeSubscriber
    viewPropertyHasChanged(varName: PropertyInfo, dependentElmtIds: Set<number>): void


    /**
     *  inform that UINode with given elmtId needs rerender
     *  does NOT exec @Watch function.
     *  only used on V2 code path from ObserveV2.fireChange.
     *
     * FIXME will still use in the future?
     */
    public uiNodeNeedUpdateV2(elmtId: number): void

    /**
     * Function to be called from the constructor of the sub component
     * to register a @Watch variable
     * @param propStr name of the variable. Note from @Provide and @Consume this is
     *      the variable name and not the alias!
     * @param callback application defined member function of sub-class
     */
    protected declareWatch(propStr: string, callback: (propName: string) => void): void

    /**
     * This View @Provide's a variable under given name
     * Call this function from the constructor of the sub class
     * @param providedPropName either the variable name or the alias defined as
     *        decorator param
     * @param store the backing store object for this variable (not the get/set variable!)
     */
    protected addProvidedVar<T>(providedPropName: string, store: ObservedPropertyAbstractPU<T>, allowOverride: boolean = false): void

    /*
      findProvidePU finds @Provided property recursively by traversing ViewPU's towards that of the UI tree root @Component:
      if 'this' ViewPU has a @Provide('providedPropName') return it, otherwise ask from its parent ViewPU.
    */
    public findProvidePU(providedPropName: string): ObservedPropertyAbstractPU<any> | undefined

    /**
     * Method for the sub-class to call from its constructor for resolving
     *       a @Consume variable and initializing its backing store
     *       with the SyncedPropertyTwoWay<T> object created from the
     *       @Provide variable's backing store.
     * @param providedPropName the name of the @Provide'd variable.
     *     This is either the @Consume decorator parameter, or variable name.
     * @param consumeVarName the @Consume variable name (not the
     *            @Consume decorator parameter)
     * @returns initializing value of the @Consume backing store
     */
    protected initializeConsume<T>(providedPropName: string,
                                   consumeVarName: string): ObservedPropertyAbstractPU<T>


    /**
     * given the elmtId of a child or child of child within this custom component
     * remember this component needs a partial update
     * @param elmtId
     */
    public markElemenDirtyById(elmtId: number): void

    /**
     * For each recorded dirty Element in this custom component
     * run its update function
     *
     */
    public updateDirtyElements(): void

    // executed on first render only
    // kept for backward compatibility with old ace-ets2bundle
    public observeComponentCreation(compilerAssignedUpdateFunc: UpdateFunc): void

    public observeComponentCreation2(compilerAssignedUpdateFunc: UpdateFunc, classObject: UIClassObject): void


    getOrCreateRecycleManager(): RecycleManager

    getRecycleManager(): RecycleManager

    hasRecycleManager(): boolean

    initRecycleManager(): void

    rebuildUpdateFunc(elmtId, compilerAssignedUpdateFunc): void

    /**
     * @function observeRecycleComponentCreation
     * @description custom node recycle creation
     * @param name custom node name
     * @param recycleUpdateFunc custom node recycle update which can be converted to a normal update function
     * @return void
     */
    public observeRecycleComponentCreation(name: string, recycleUpdateFunc: RecycleUpdateFunc): void

    // param is used by BuilderNode
    aboutToReuseInternal(param?: Object): void

    stopRecursiveRecycle(): void

    aboutToRecycleInternal(): void

    // add current JS object to it's parent recycle manager
    public recycleSelf(name: string): void

    public isRecycled(): boolean

    public UpdateLazyForEachElements(elmtIds: Array<number>): void

    /**
     * CreateStorageLink and CreateStorageLinkPU are used by the implementation of @StorageLink and
     * @LocalStotrageLink in full update and partial update solution respectively.
     * These are not part of the public AppStorage API , apps should not use.
     * @param storagePropName - key in LocalStorage
     * @param defaultValue - value to use when creating a new prop in the LocalStotage
     * @param owningView - the View/ViewPU owning the @StorageLink/@LocalStorageLink variable
     * @param viewVariableName -  @StorageLink/@LocalStorageLink variable name
     * @returns SynchedPropertySimple/ObjectTwoWay/PU
     */
    public createStorageLink<T>(storagePropName: string, defaultValue: T, viewVariableName: string): ObservedPropertyAbstractPU<T>
    public createStorageProp<T>(storagePropName: string, defaultValue: T, viewVariableName: string): ObservedPropertyAbstractPU<T>

    public createLocalStorageLink<T>(storagePropName: string, defaultValue: T,
                                     viewVariableName: string): ObservedPropertyAbstractPU<T>

    public createLocalStorageProp<T>(storagePropName: string, defaultValue: T,
                                     viewVariableName: string): ObservedPropertyAbstractPU<T>

} // class ViewPU

