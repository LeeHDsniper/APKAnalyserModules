.class Lit/sephiroth/android/library/picasso/Dispatcher$DispatcherHandler;
.super Landroid/os/Handler;
.source "Dispatcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/sephiroth/android/library/picasso/Dispatcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DispatcherHandler"
.end annotation


# instance fields
.field private final dispatcher:Lit/sephiroth/android/library/picasso/Dispatcher;


# direct methods
.method public constructor <init>(Landroid/os/Looper;Lit/sephiroth/android/library/picasso/Dispatcher;)V
    .registers 3
    .param p1, "looper"    # Landroid/os/Looper;
    .param p2, "dispatcher"    # Lit/sephiroth/android/library/picasso/Dispatcher;

    .prologue
    .line 499
    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 500
    iput-object p2, p0, Lit/sephiroth/android/library/picasso/Dispatcher$DispatcherHandler;->dispatcher:Lit/sephiroth/android/library/picasso/Dispatcher;

    .line 501
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 10
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 504
    iget v6, p1, Landroid/os/Message;->what:I

    packed-switch v6, :pswitch_data_70

    .line 554
    :pswitch_7
    sget-object v4, Lit/sephiroth/android/library/picasso/Picasso;->HANDLER:Landroid/os/Handler;

    new-instance v5, Lit/sephiroth/android/library/picasso/Dispatcher$DispatcherHandler$1;

    invoke-direct {v5, p0, p1}, Lit/sephiroth/android/library/picasso/Dispatcher$DispatcherHandler$1;-><init>(Lit/sephiroth/android/library/picasso/Dispatcher$DispatcherHandler;Landroid/os/Message;)V

    invoke-virtual {v4, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 560
    :goto_11
    return-void

    .line 506
    :pswitch_12
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lit/sephiroth/android/library/picasso/Action;

    .line 507
    .local v0, "action":Lit/sephiroth/android/library/picasso/Action;
    iget-object v4, p0, Lit/sephiroth/android/library/picasso/Dispatcher$DispatcherHandler;->dispatcher:Lit/sephiroth/android/library/picasso/Dispatcher;

    invoke-virtual {v4, v0}, Lit/sephiroth/android/library/picasso/Dispatcher;->performSubmit(Lit/sephiroth/android/library/picasso/Action;)V

    goto :goto_11

    .line 511
    .end local v0    # "action":Lit/sephiroth/android/library/picasso/Action;
    :pswitch_1c
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lit/sephiroth/android/library/picasso/Action;

    .line 512
    .restart local v0    # "action":Lit/sephiroth/android/library/picasso/Action;
    iget-object v4, p0, Lit/sephiroth/android/library/picasso/Dispatcher$DispatcherHandler;->dispatcher:Lit/sephiroth/android/library/picasso/Dispatcher;

    invoke-virtual {v4, v0}, Lit/sephiroth/android/library/picasso/Dispatcher;->performCancel(Lit/sephiroth/android/library/picasso/Action;)V

    goto :goto_11

    .line 516
    .end local v0    # "action":Lit/sephiroth/android/library/picasso/Action;
    :pswitch_26
    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 517
    .local v3, "tag":Ljava/lang/Object;
    iget-object v4, p0, Lit/sephiroth/android/library/picasso/Dispatcher$DispatcherHandler;->dispatcher:Lit/sephiroth/android/library/picasso/Dispatcher;

    invoke-virtual {v4, v3}, Lit/sephiroth/android/library/picasso/Dispatcher;->performPauseTag(Ljava/lang/Object;)V

    goto :goto_11

    .line 521
    .end local v3    # "tag":Ljava/lang/Object;
    :pswitch_2e
    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 522
    .restart local v3    # "tag":Ljava/lang/Object;
    iget-object v4, p0, Lit/sephiroth/android/library/picasso/Dispatcher$DispatcherHandler;->dispatcher:Lit/sephiroth/android/library/picasso/Dispatcher;

    invoke-virtual {v4, v3}, Lit/sephiroth/android/library/picasso/Dispatcher;->performResumeTag(Ljava/lang/Object;)V

    goto :goto_11

    .line 526
    .end local v3    # "tag":Ljava/lang/Object;
    :pswitch_36
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Lit/sephiroth/android/library/picasso/BitmapHunter;

    .line 527
    .local v1, "hunter":Lit/sephiroth/android/library/picasso/BitmapHunter;
    iget-object v4, p0, Lit/sephiroth/android/library/picasso/Dispatcher$DispatcherHandler;->dispatcher:Lit/sephiroth/android/library/picasso/Dispatcher;

    invoke-virtual {v4, v1}, Lit/sephiroth/android/library/picasso/Dispatcher;->performComplete(Lit/sephiroth/android/library/picasso/BitmapHunter;)V

    goto :goto_11

    .line 531
    .end local v1    # "hunter":Lit/sephiroth/android/library/picasso/BitmapHunter;
    :pswitch_40
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Lit/sephiroth/android/library/picasso/BitmapHunter;

    .line 532
    .restart local v1    # "hunter":Lit/sephiroth/android/library/picasso/BitmapHunter;
    iget-object v4, p0, Lit/sephiroth/android/library/picasso/Dispatcher$DispatcherHandler;->dispatcher:Lit/sephiroth/android/library/picasso/Dispatcher;

    invoke-virtual {v4, v1}, Lit/sephiroth/android/library/picasso/Dispatcher;->performRetry(Lit/sephiroth/android/library/picasso/BitmapHunter;)V

    goto :goto_11

    .line 536
    .end local v1    # "hunter":Lit/sephiroth/android/library/picasso/BitmapHunter;
    :pswitch_4a
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Lit/sephiroth/android/library/picasso/BitmapHunter;

    .line 537
    .restart local v1    # "hunter":Lit/sephiroth/android/library/picasso/BitmapHunter;
    iget-object v4, p0, Lit/sephiroth/android/library/picasso/Dispatcher$DispatcherHandler;->dispatcher:Lit/sephiroth/android/library/picasso/Dispatcher;

    invoke-virtual {v4, v1, v5}, Lit/sephiroth/android/library/picasso/Dispatcher;->performError(Lit/sephiroth/android/library/picasso/BitmapHunter;Z)V

    goto :goto_11

    .line 541
    .end local v1    # "hunter":Lit/sephiroth/android/library/picasso/BitmapHunter;
    :pswitch_54
    iget-object v4, p0, Lit/sephiroth/android/library/picasso/Dispatcher$DispatcherHandler;->dispatcher:Lit/sephiroth/android/library/picasso/Dispatcher;

    invoke-virtual {v4}, Lit/sephiroth/android/library/picasso/Dispatcher;->performBatchComplete()V

    goto :goto_11

    .line 545
    :pswitch_5a
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/net/NetworkInfo;

    .line 546
    .local v2, "info":Landroid/net/NetworkInfo;
    iget-object v4, p0, Lit/sephiroth/android/library/picasso/Dispatcher$DispatcherHandler;->dispatcher:Lit/sephiroth/android/library/picasso/Dispatcher;

    invoke-virtual {v4, v2}, Lit/sephiroth/android/library/picasso/Dispatcher;->performNetworkStateChange(Landroid/net/NetworkInfo;)V

    goto :goto_11

    .line 550
    .end local v2    # "info":Landroid/net/NetworkInfo;
    :pswitch_64
    iget-object v6, p0, Lit/sephiroth/android/library/picasso/Dispatcher$DispatcherHandler;->dispatcher:Lit/sephiroth/android/library/picasso/Dispatcher;

    iget v7, p1, Landroid/os/Message;->arg1:I

    if-ne v7, v4, :cond_6e

    :goto_6a
    invoke-virtual {v6, v4}, Lit/sephiroth/android/library/picasso/Dispatcher;->performAirplaneModeChange(Z)V

    goto :goto_11

    :cond_6e
    move v4, v5

    goto :goto_6a

    .line 504
    :pswitch_data_70
    .packed-switch 0x1
        :pswitch_12
        :pswitch_1c
        :pswitch_7
        :pswitch_36
        :pswitch_40
        :pswitch_4a
        :pswitch_54
        :pswitch_7
        :pswitch_5a
        :pswitch_64
        :pswitch_26
        :pswitch_2e
    .end packed-switch
.end method
