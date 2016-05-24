.class public Lrx/android/schedulers/HandlerThreadScheduler;
.super Lrx/Scheduler;
.source "HandlerThreadScheduler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/android/schedulers/HandlerThreadScheduler$InnerHandlerThreadScheduler;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final handler:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/os/Handler;)V
    .registers 2
    .param p1, "handler"    # Landroid/os/Handler;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 40
    invoke-direct {p0}, Lrx/Scheduler;-><init>()V

    .line 41
    iput-object p1, p0, Lrx/android/schedulers/HandlerThreadScheduler;->handler:Landroid/os/Handler;

    .line 42
    return-void
.end method


# virtual methods
.method public createWorker()Lrx/Scheduler$Worker;
    .registers 3

    .prologue
    .line 46
    new-instance v0, Lrx/android/schedulers/HandlerThreadScheduler$InnerHandlerThreadScheduler;

    iget-object v1, p0, Lrx/android/schedulers/HandlerThreadScheduler;->handler:Landroid/os/Handler;

    invoke-direct {v0, v1}, Lrx/android/schedulers/HandlerThreadScheduler$InnerHandlerThreadScheduler;-><init>(Landroid/os/Handler;)V

    return-object v0
.end method
