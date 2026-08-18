/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  com.intellij.openapi.diagnostic.Logger
 */
package com.huawei.deveco.programanalysis.apiscan.task;

import com.intellij.openapi.diagnostic.Logger;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.RejectedExecutionHandler;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class ThreadPoolScheduledExecutor {
    private static final Logger LOGGER = Logger.getInstance(ThreadPoolScheduledExecutor.class);
    private ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(1, 1, 0L, TimeUnit.MILLISECONDS, new LinkedBlockingQueue<Runnable>(10), new CustomRejectedExecutionHandler());
    private ScheduledThreadPoolExecutor scheduledThreadPoolExecutor = new ScheduledThreadPoolExecutor(1);

    public void startScheduledTask(Runnable task, long initialDelay, long period, TimeUnit timeUnit) {
        this.scheduledThreadPoolExecutor.scheduleAtFixedRate(() -> this.threadPoolExecutor.execute(task), initialDelay, period, timeUnit);
    }

    public void shutdown() {
        this.scheduledThreadPoolExecutor.shutdown();
        this.threadPoolExecutor.shutdown();
    }

    private static class CustomRejectedExecutionHandler
    implements RejectedExecutionHandler {
        private CustomRejectedExecutionHandler() {
        }

        @Override
        public void rejectedExecution(Runnable r, ThreadPoolExecutor executor) {
            int queueSize = executor.getQueue().size();
            LOGGER.warn("Task rejected. Current queue size: " + queueSize);
        }
    }
}

