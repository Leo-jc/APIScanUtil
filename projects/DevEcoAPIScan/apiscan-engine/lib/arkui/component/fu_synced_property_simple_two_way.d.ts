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
 * SynchedPropertySimpleTwoWay
 *
 * all definitions in this file are framework internal
 */
class SynchedPropertySimpleTwoWay<T> extends ObservedPropertySimpleAbstract<T>
    implements ISinglePropertyChangeSubscriber<T> {

    constructor(source: ObservedPropertyAbstract<T>, owningView: IPropertySubscriber, owningViewPropNme: PropertyInfo)

    /*
    like a destructor, need to call this before deleting
    the property.
  */
    aboutToBeDeleted(): void

    // this object is subscriber to  SynchedPropertySimpleTwoWay
    // will call this cb function when property has changed
    // a set (newValue) is not done because get reads through for the source_
    hasChanged(newValue: T): void

    // get 'read through` from the ObservedProperty
    public get(): T

    // set 'writes through` to the ObservedProperty
    public set(newValue: T): void

    /**
     * These functions are meant for use in connection with the App Stoage and
     * business logic implementation.
     * the created Link and Prop will update when 'this' property value
     * changes.
     */
    public createLink(subscribeOwner?: IPropertySubscriber,
                      linkPropName?: PropertyInfo): ObservedPropertyAbstract<T>

    public createProp(subscribeOwner?: IPropertySubscriber,
                      propPropName?: PropertyInfo): ObservedPropertyAbstract<T>

}
