/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
 * SynchedPropertyObjectTwoWay
 *
 * all definitions in this file are framework internal
 */
class SynchedPropertyObjectTwoWay<C extends Object>
    extends ObservedPropertyObjectAbstract<C>
    implements ISinglePropertyChangeSubscriber<C> {

    constructor(linkSource: ObservedPropertyObjectAbstract<C>,
                owningChildView: IPropertySubscriber,
                thisPropertyName: PropertyInfo)

    /*
    like a destructor, need to call this before deleting
    the property.
    */
    aboutToBeDeleted(): void


    // this object is subscriber to ObservedObject
    // will call this cb function when property has changed
    hasChanged(newValue: C): void


    // get 'read through` from the ObservedProperty
    public get(): C

    // set 'writes through` to the ObservedProperty
    public set(newValue: C): void

    /**
     * These functions are meant for use in connection with the App Stoage and
     * business logic implementation.
     * the created Link and Prop will update when 'this' property value
     * changes.
     */
    public createLink(subscribeOwner?: IPropertySubscriber,
                      linkPropName?: PropertyInfo): ObservedPropertyAbstract<C>

    public createProp(subscribeOwner?: IPropertySubscriber,
                      linkPropName?: PropertyInfo): ObservedPropertyAbstract<C>

}
