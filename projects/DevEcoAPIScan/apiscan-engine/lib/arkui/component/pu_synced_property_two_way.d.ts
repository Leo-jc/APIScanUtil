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
 * SynchedPropertyObjectTwoWayPU
 * implementation of @Link and @Consume decorated variables of type class object
 *
 * all definitions in this file are framework internal
 */

class SynchedPropertyTwoWayPU<C> extends ObservedPropertyAbstractPU<C>
    implements PeerChangeEventReceiverPU<C>, ObservedObjectEventsPUReceiver<C> {

    private source_: ObservedPropertyObjectAbstract<C>;


    constructor(source: ObservedPropertyObjectAbstract<C>,
                owningChildView: IPropertySubscriber,
                thisPropertyName: PropertyInfo)

    /*
    like a destructor, need to call this before deleting
    the property.
    */
    aboutToBeDeleted(): void


    /**
     * Called when sync peer ObservedPropertyObject or SynchedPropertyObjectTwoWay has changed value
     * that peer can be in either parent or child component if 'this' is used for a @Link
     * that peer can be in either ancestor or descendant component if 'this' is used for a @Consume
     * @param eventSource
     */
    public syncPeerHasChanged(eventSource: ObservedPropertyAbstractPU<C>): void

    public syncPeerTrackedPropertyHasChanged(eventSource: ObservedPropertyAbstractPU<C>, changedTrackedObjectPropertyName: string): void

    public getUnmonitored(): C

    // get 'read through` from the ObservedProperty
    public get(): C

    // set 'writes through` to the ObservedProperty
    public set(newValue: C): void


    protected onOptimisedObjectPropertyRead(readObservedObject: C, readPropertyName: string, isTracked: boolean): void
}

// class definitions for backward compatibility
class SynchedPropertyObjectTwoWayPU<C> extends SynchedPropertyTwoWayPU<C> {

}

class SynchedPropertySimpleTwoWayPU<T> extends SynchedPropertyTwoWayPU<T> {

}

