.class public Lcom/facebook/BoltsMeasurementEventListener;
.super Landroid/content/BroadcastReceiver;
.source "BoltsMeasurementEventListener.java"


# instance fields
.field private applicationContext:Landroid/content/Context;


# direct methods
.method private close()V
    .registers 3

    .prologue
    .line 30
    iget-object v1, p0, Lcom/facebook/BoltsMeasurementEventListener;->applicationContext:Landroid/content/Context;

    invoke-static {v1}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    .line 31
    .local v0, "broadcastManager":Landroid/support/v4/content/LocalBroadcastManager;
    invoke-virtual {v0, p0}, Landroid/support/v4/content/LocalBroadcastManager;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 32
    return-void
.end method


# virtual methods
.method protected finalize()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 45
    :try_start_0
    invoke-direct {p0}, Lcom/facebook/BoltsMeasurementEventListener;->close()V
    :try_end_3
    .catchall {:try_start_0 .. :try_end_3} :catchall_7

    .line 47
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 49
    return-void

    .line 46
    :catchall_7
    move-exception v0

    .line 47
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 48
    throw v0
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 13
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 53
    invoke-static {p1}, Lcom/facebook/AppEventsLogger;->newLogger(Landroid/content/Context;)Lcom/facebook/AppEventsLogger;

    move-result-object v0

    .line 54
    .local v0, "appEventsLogger":Lcom/facebook/AppEventsLogger;
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "bf_"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "event_name"

    invoke-virtual {p2, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 55
    .local v2, "eventName":Ljava/lang/String;
    const-string v6, "event_args"

    invoke-virtual {p2, v6}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    .line 56
    .local v1, "eventArgs":Landroid/os/Bundle;
    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    .line 57
    .local v4, "logData":Landroid/os/Bundle;
    invoke-virtual {v1}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_2c
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_36

    .line 61
    invoke-virtual {v0, v2, v4}, Lcom/facebook/AppEventsLogger;->logEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 62
    return-void

    .line 57
    :cond_36
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 58
    .local v3, "key":Ljava/lang/String;
    const-string v6, "[^0-9a-zA-Z _-]"

    const-string v8, "-"

    invoke-virtual {v3, v6, v8}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v8, "^[ -]*"

    const-string v9, ""

    invoke-virtual {v6, v8, v9}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v8, "[ -]*$"

    const-string v9, ""

    invoke-virtual {v6, v8, v9}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 59
    .local v5, "safeKey":Ljava/lang/String;
    invoke-virtual {v1, v3}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v4, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2c
.end method
