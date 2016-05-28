.class public final Lde/greenrobot/event/NoSubscriberEvent;
.super Ljava/lang/Object;
.source "NoSubscriberEvent.java"


# instance fields
.field public final eventBus:Lde/greenrobot/event/EventBus;

.field public final originalEvent:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lde/greenrobot/event/EventBus;Ljava/lang/Object;)V
    .registers 3
    .param p1, "eventBus"    # Lde/greenrobot/event/EventBus;
    .param p2, "originalEvent"    # Ljava/lang/Object;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lde/greenrobot/event/NoSubscriberEvent;->eventBus:Lde/greenrobot/event/EventBus;

    .line 32
    iput-object p2, p0, Lde/greenrobot/event/NoSubscriberEvent;->originalEvent:Ljava/lang/Object;

    .line 33
    return-void
.end method
