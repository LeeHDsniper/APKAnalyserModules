.class public final Lde/greenrobot/event/SubscriberExceptionEvent;
.super Ljava/lang/Object;
.source "SubscriberExceptionEvent.java"


# instance fields
.field public final causingEvent:Ljava/lang/Object;

.field public final causingSubscriber:Ljava/lang/Object;

.field public final eventBus:Lde/greenrobot/event/EventBus;

.field public final throwable:Ljava/lang/Throwable;


# direct methods
.method public constructor <init>(Lde/greenrobot/event/EventBus;Ljava/lang/Throwable;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5
    .param p1, "eventBus"    # Lde/greenrobot/event/EventBus;
    .param p2, "throwable"    # Ljava/lang/Throwable;
    .param p3, "causingEvent"    # Ljava/lang/Object;
    .param p4, "causingSubscriber"    # Ljava/lang/Object;

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lde/greenrobot/event/SubscriberExceptionEvent;->eventBus:Lde/greenrobot/event/EventBus;

    .line 39
    iput-object p2, p0, Lde/greenrobot/event/SubscriberExceptionEvent;->throwable:Ljava/lang/Throwable;

    .line 40
    iput-object p3, p0, Lde/greenrobot/event/SubscriberExceptionEvent;->causingEvent:Ljava/lang/Object;

    .line 41
    iput-object p4, p0, Lde/greenrobot/event/SubscriberExceptionEvent;->causingSubscriber:Ljava/lang/Object;

    .line 42
    return-void
.end method
