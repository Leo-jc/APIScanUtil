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
 * ObservedPropertyObject
 *
 * all definitions in this file are framework internal
 *
 * class that holds an actual property value of type T
 * uses its base class to manage subscribers to this
 * property.
 */
class ObservedPropertyObject<T extends Object> extends ObservedPropertyObjectAbstract<T>
    implements ISinglePropertyChangeSubscriber<T> {

    constructor(value: T, owningView: IPropertySubscriber, propertyName: PropertyInfo) {
        super(owningView, propertyName);
        this.setValueInternal(value);
    }

    aboutToBeDeleted(unsubscribeMe?: IPropertySubscriber): void


    public get(): T

    public set(newValue: T): void

    /**
     * These functions are used
     *   LocalStorage.link  (also in partial update config)
     *   (FU)View.initializeConsumeinitializeConsume
     */
    public createLink(subscribeOwner?: IPropertySubscriber,
                      linkPropName?: PropertyInfo): ObservedPropertyAbstract<T>

    public createProp(subscribeOwner?: IPropertySubscriber,
                      linkPropName?: PropertyInfo): ObservedPropertyAbstract<T>
}
