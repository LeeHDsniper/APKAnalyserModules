.class Lrx/android/schedulers/HandlerThreadScheduler$InnerHandlerThreadScheduler$1;
.super Ljava/lang/Object;
.source "HandlerThreadScheduler.java"

# interfaces
.implements Lrx/functions/Action0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/android/schedulers/HandlerThreadScheduler$InnerHandlerThreadScheduler;->schedule(Lrx/functions/Action0;JLjava/util/concurrent/TimeUnit;)Lrx/Subscription;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lrx/android/schedulers/HandlerThreadScheduler$InnerHandlerThreadScheduler;

.field final synthetic val$scheduledAction:Lrx/internal/schedulers/ScheduledAction;


# direct methods
.method constructor <init>(Lrx/android/schedulers/HandlerThreadScheduler$InnerHandlerThreadScheduler;Lrx/internal/schedulers/ScheduledAction;)V
    .registers 3

    .prologue
    .line 74
    iput-object p1, p0, Lrx/android/schedulers/HandlerThreadScheduler$InnerHandlerThreadScheduler$1;->this$0:Lrx/android/schedulers/HandlerThreadScheduler$InnerHandlerThreadScheduler;

    iput-object p2, p0, Lrx/android/schedulers/HandlerThreadScheduler$InnerHandlerThreadScheduler$1;->val$scheduledAction:Lrx/internal/schedulers/ScheduledAction;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()V
    .registers 3

    .prologue
    .line 77
    iget-object v0, p0, Lrx/android/schedulers/HandlerThreadScheduler$InnerHandlerThreadScheduler$1;->this$0:Lrx/android/schedulers/HandlerThreadScheduler$InnerHandlerThreadScheduler;

    # getter for: Lrx/android/schedulers/HandlerThreadScheduler$InnerHandlerThreadScheduler;->handler:Landroid/os/Handler;
    invoke-static {v0}, Lrx/android/schedulers/HandlerThreadScheduler$InnerHandlerThreadScheduler;->access$000(Lrx/android/schedulers/HandlerThreadScheduler$InnerHandlerThreadScheduler;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lrx/android/schedulers/HandlerThreadScheduler$InnerHandlerThreadScheduler$1;->val$scheduledAction:Lrx/internal/schedulers/ScheduledAction;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 78
    return-void
.end method
