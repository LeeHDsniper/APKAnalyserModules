.class public Lde/greenrobot/event/EventBusBuilder;
.super Ljava/lang/Object;
.source "EventBusBuilder.java"


# static fields
.field private static final DEFAULT_EXECUTOR_SERVICE:Ljava/util/concurrent/ExecutorService;


# instance fields
.field eventInheritance:Z

.field executorService:Ljava/util/concurrent/ExecutorService;

.field logNoSubscriberMessages:Z

.field logSubscriberExceptions:Z

.field sendNoSubscriberEvent:Z

.field sendSubscriberExceptionEvent:Z

.field skipMethodVerificationForClasses:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Class",
            "<*>;>;"
        }
    .end annotation
.end field

.field throwSubscriberException:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 28
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lde/greenrobot/event/EventBusBuilder;->DEFAULT_EXECUTOR_SERVICE:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x1

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-boolean v0, p0, Lde/greenrobot/event/EventBusBuilder;->logSubscriberExceptions:Z

    .line 31
    iput-boolean v0, p0, Lde/greenrobot/event/EventBusBuilder;->logNoSubscriberMessages:Z

    .line 32
    iput-boolean v0, p0, Lde/greenrobot/event/EventBusBuilder;->sendSubscriberExceptionEvent:Z

    .line 33
    iput-boolean v0, p0, Lde/greenrobot/event/EventBusBuilder;->sendNoSubscriberEvent:Z

    .line 35
    iput-boolean v0, p0, Lde/greenrobot/event/EventBusBuilder;->eventInheritance:Z

    .line 36
    sget-object v0, Lde/greenrobot/event/EventBusBuilder;->DEFAULT_EXECUTOR_SERVICE:Ljava/util/concurrent/ExecutorService;

    iput-object v0, p0, Lde/greenrobot/event/EventBusBuilder;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 40
    return-void
.end method
