/*
 * Copyright (c) 2021-2022 Huawei Device Co., Ltd.
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
 * View (for full update)
 *
 * all definitions in this file are framework internal
 */

// Nativeview
// implemented in C++  for release
// and in utest/view_native_mock.ts for testing
abstract class View extends NativeViewFullUpdate implements IMultiPropertiesChangeSubscriber, IMultiPropertiesReadSubscriber {

    // @Provide'd variables by this class and its ancestors
    protected providedVars_: ProvidedVarsMap;

    // my LocalStorge instance, shared with ancestor Views.
    // create a default instance on demand if none is initialized
    protected localStoragebackStore_: LocalStorage = undefined;

    protected get localStorage_()
    protected set localStorage_(instance: LocalStorage)

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
     * @param compilerAssignedUniqueChildId Tw
     * @param parent
     * @param localStorage
     */

    constructor(compilerAssignedUniqueChildId: string, parent: View, localStorage?: LocalStorage)

    // globally unique id, this is different from compilerAssignedUniqueChildId!
    id__(): number

    // temporary function, do not use, it will be removed soon!
    // prupsoe is to allow eDSL transpiler to fix a bug that
    // relies on this method
    id(): number

    // inform the subscribed property
    // that the View and thereby all properties
    // are about to be deleted
    abstract aboutToBeDeleted(): void;

    abstract updateWithValueParams(params: Object): void;

    propertyHasChanged(info?: PropertyInfo): void

    propertyRead(info?: PropertyInfo): void


    // for test purposes
    public propertiesNeededToRender(): Set<string>

    public aboutToRender(): void

    public aboutToContinueRender(): void

    public onRenderDone(): void


    /**
     * Function to be called from the constructor of the sub component
     * to register a @Watch varibale
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
    protected addProvidedVar<T>(providedPropName: string, store: ObservedPropertyAbstract<T>): void

    /**
     * Method for the sub-class to call from its constructor for resolving
     *       a @Consume variable and initializing its backing store
     *       with the yncedPropertyTwoWay<T> object created from the
     *       @Provide variable's backing store.
     * @param providedPropName the name of the @Provide'd variable.
     *     This is either the @Consume decortor parameter, or variable name.
     * @param consumeVarName the @Consume variable name (not the
     *            @Consume decortor parameter)
     * @returns initiaizing value of the @Consume backing store
     */
    protected initializeConsume<T>(providedPropName: string,
                                   consumeVarName: string): ObservedPropertyAbstract<T>
}
