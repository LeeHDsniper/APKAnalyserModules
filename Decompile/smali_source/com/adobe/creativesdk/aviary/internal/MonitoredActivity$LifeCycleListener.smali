.class public interface abstract Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity$LifeCycleListener;
.super Ljava/lang/Object;
.source "MonitoredActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "LifeCycleListener"
.end annotation


# virtual methods
.method public abstract onActivityCreated(Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;)V
.end method

.method public abstract onActivityDestroyed(Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;)V
.end method

.method public abstract onActivityStarted(Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;)V
.end method

.method public abstract onActivityStopped(Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;)V
.end method
