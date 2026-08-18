/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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
 * ObservedPropertyObjectPU
 * implementation of @State and @Provide decorated variables of type class object
 *
 * all definitions in this file are framework internal
 *
 * class that holds an actual property value of type T
 * uses its base class to manage subscribers to this
 * property.
 */

class ObservedPropertyPU<T> extends ObservedPropertyAbstractPU<T>
    implements PeerChangeEventReceiverPU<T>, ObservedObjectEventsPUReceiver<T> {

    private wrappedValue_: T;

    constructor(localInitValue: T, owningView: IPropertySubscriber, propertyName: PropertyInfo)

    aboutToBeDeleted(unsubscribeMe?: IPropertySubscriber): void

    /**
     * Called by a SynchedPropertyObjectTwoWayPU (@Link, @Consume) that uses this as sync peer when it has changed
     * @param eventSource
     */
    public syncPeerHasChanged(eventSource: ObservedPropertyAbstractPU<T>): void

    public syncPeerTrackedPropertyHasChanged(eventSource: ObservedPropertyAbstractPU<T>, changedTrackedObjectPropertyName: string): void

    /**
     * Wrapped ObservedObjectPU has changed
     * @param souceObject
     * @param changedPropertyName
     */
    public objectPropertyHasChangedPU(souceObject: ObservedObject<T>, changedPropertyName: string): void

    /*
      actually update this.wrappedValue_
      called needs to do value change check
      and also notify with this.aboutToChange();
    */
    private setValueInternal(newValue: T): boolean

    public get(): T

    public getUnmonitored(): T

    public set(newValue: T): void

    protected onOptimisedObjectPropertyRead(readObservedObject: T, readPropertyName: string, isTracked: boolean): void
}

// class definitions for backward compatibility
class ObservedPropertyObjectPU<T> extends ObservedPropertyPU<T> {

}

class ObservedPropertySimplePU<T> extends ObservedPropertyPU<T> {

}
