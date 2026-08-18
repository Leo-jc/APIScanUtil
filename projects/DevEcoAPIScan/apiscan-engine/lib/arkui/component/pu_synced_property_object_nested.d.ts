/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
 * SynchedPropertyNestedObjectPU
 * implementation of @ObjectLink decorated variables
 *
 * all definitions in this file are framework internal
 *
 */
class SynchedPropertyNestedObjectPU<C extends Object>
    extends ObservedPropertyAbstractPU<C>
    implements ObservedObjectEventsPUReceiver<C> {

    private obsObject_: C = undefined;

    /**
     * Construct a Property of a su component that links to a variable of parent view that holds an ObservedObject
     * example
     *   this.b.$a with b of type PC and a of type C, or
     *   this.$b[5] with this.b of type PC and array item b[5] of type C;
     *
     * @param subscribeMe
     * @param propName
     */
    constructor(obsObject: C,
                owningChildView: IPropertySubscriber, propertyName: PropertyInfo)

    /*
    like a destructor, need to call this before deleting
    the property.
    */
    aboutToBeDeleted(): void

    public getUnmonitored(): C

    // get 'read through` from the ObservedProperty
    public get(): C

    // parent ViewPU rerender, runs update lambda with child ViewPU that contains a @ObjectLink
    // calls ViewPU.updateStateVarsByElmtId, calls updateStateVars in application class, calls this 'set' function
    public set(newValue: C): void

    protected onOptimisedObjectPropertyRead(readObservedObject: C, readPropertyName: string, isTracked: boolean): void
}

/** backward compatibility after typo in classname fix */
class SynchedPropertyNesedObjectPU<C extends Object> extends SynchedPropertyNestedObjectPU<C> {

}