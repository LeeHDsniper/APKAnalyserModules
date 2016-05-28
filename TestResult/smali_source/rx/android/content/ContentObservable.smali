.class public final Lrx/android/content/ContentObservable;
.super Ljava/lang/Object;
.source "ContentObservable.java"


# direct methods
.method public static fromBroadcast(Landroid/content/Context;Landroid/content/IntentFilter;)Lrx/Observable;
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "filter"    # Landroid/content/IntentFilter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/content/IntentFilter;",
            ")",
            "Lrx/Observable",
            "<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 36
    new-instance v0, Lrx/android/content/OnSubscribeBroadcastRegister;

    invoke-direct {v0, p0, p1, v1, v1}, Lrx/android/content/OnSubscribeBroadcastRegister;-><init>(Landroid/content/Context;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method
