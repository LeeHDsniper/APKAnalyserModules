.class final Lde/greenrobot/event/EventBus$PostingThreadState;
.super Ljava/lang/Object;
.source "EventBus.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/greenrobot/event/EventBus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "PostingThreadState"
.end annotation


# instance fields
.field canceled:Z

.field event:Ljava/lang/Object;

.field final eventQueue:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field isMainThread:Z

.field isPosting:Z

.field subscription:Lde/greenrobot/event/Subscription;


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 533
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 534
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lde/greenrobot/event/EventBus$PostingThreadState;->eventQueue:Ljava/util/List;

    return-void
.end method
