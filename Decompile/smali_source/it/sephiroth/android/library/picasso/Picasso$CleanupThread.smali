.class Lit/sephiroth/android/library/picasso/Picasso$CleanupThread;
.super Ljava/lang/Thread;
.source "Picasso.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/sephiroth/android/library/picasso/Picasso;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CleanupThread"
.end annotation


# instance fields
.field private final handler:Landroid/os/Handler;

.field private final referenceQueue:Ljava/lang/ref/ReferenceQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/ReferenceQueue",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/ref/ReferenceQueue;Landroid/os/Handler;)V
    .registers 4
    .param p2, "handler"    # Landroid/os/Handler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/ReferenceQueue",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Landroid/os/Handler;",
            ")V"
        }
    .end annotation

    .prologue
    .line 654
    .local p1, "referenceQueue":Ljava/lang/ref/ReferenceQueue;, "Ljava/lang/ref/ReferenceQueue<Ljava/lang/Object;>;"
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 655
    iput-object p1, p0, Lit/sephiroth/android/library/picasso/Picasso$CleanupThread;->referenceQueue:Ljava/lang/ref/ReferenceQueue;

    .line 656
    iput-object p2, p0, Lit/sephiroth/android/library/picasso/Picasso$CleanupThread;->handler:Landroid/os/Handler;

    .line 657
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lit/sephiroth/android/library/picasso/Picasso$CleanupThread;->setDaemon(Z)V

    .line 658
    const-string v0, "Picasso-refQueue"

    invoke-virtual {p0, v0}, Lit/sephiroth/android/library/picasso/Picasso$CleanupThread;->setName(Ljava/lang/String;)V

    .line 659
    return-void
.end method


# virtual methods
.method public run()V
    .registers 7

    .prologue
    .line 662
    const/16 v3, 0xa

    invoke-static {v3}, Landroid/os/Process;->setThreadPriority(I)V

    .line 670
    :goto_5
    :try_start_5
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/Picasso$CleanupThread;->referenceQueue:Ljava/lang/ref/ReferenceQueue;

    const-wide/16 v4, 0x3e8

    .line 671
    invoke-virtual {v3, v4, v5}, Ljava/lang/ref/ReferenceQueue;->remove(J)Ljava/lang/ref/Reference;

    move-result-object v2

    check-cast v2, Lit/sephiroth/android/library/picasso/Action$RequestWeakReference;

    .line 672
    .local v2, "remove":Lit/sephiroth/android/library/picasso/Action$RequestWeakReference;, "Lit/sephiroth/android/library/picasso/Action$RequestWeakReference<*>;"
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/Picasso$CleanupThread;->handler:Landroid/os/Handler;

    invoke-virtual {v3}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v1

    .line 673
    .local v1, "message":Landroid/os/Message;
    if-eqz v2, :cond_26

    .line 674
    const/4 v3, 0x3

    iput v3, v1, Landroid/os/Message;->what:I

    .line 675
    iget-object v3, v2, Lit/sephiroth/android/library/picasso/Action$RequestWeakReference;->action:Lit/sephiroth/android/library/picasso/Action;

    iput-object v3, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 676
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/Picasso$CleanupThread;->handler:Landroid/os/Handler;

    invoke-virtual {v3, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_5

    .line 680
    .end local v1    # "message":Landroid/os/Message;
    .end local v2    # "remove":Lit/sephiroth/android/library/picasso/Action$RequestWeakReference;, "Lit/sephiroth/android/library/picasso/Action$RequestWeakReference<*>;"
    :catch_24
    move-exception v0

    .line 691
    :goto_25
    return-void

    .line 678
    .restart local v1    # "message":Landroid/os/Message;
    .restart local v2    # "remove":Lit/sephiroth/android/library/picasso/Action$RequestWeakReference;, "Lit/sephiroth/android/library/picasso/Action$RequestWeakReference<*>;"
    :cond_26
    invoke-virtual {v1}, Landroid/os/Message;->recycle()V
    :try_end_29
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_29} :catch_24
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_29} :catch_2a

    goto :goto_5

    .line 682
    .end local v1    # "message":Landroid/os/Message;
    .end local v2    # "remove":Lit/sephiroth/android/library/picasso/Action$RequestWeakReference;, "Lit/sephiroth/android/library/picasso/Action$RequestWeakReference<*>;"
    :catch_2a
    move-exception v0

    .line 683
    .local v0, "e":Ljava/lang/Exception;
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/Picasso$CleanupThread;->handler:Landroid/os/Handler;

    new-instance v4, Lit/sephiroth/android/library/picasso/Picasso$CleanupThread$1;

    invoke-direct {v4, p0, v0}, Lit/sephiroth/android/library/picasso/Picasso$CleanupThread$1;-><init>(Lit/sephiroth/android/library/picasso/Picasso$CleanupThread;Ljava/lang/Exception;)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_25
.end method
