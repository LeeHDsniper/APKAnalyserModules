.class Lrx/android/content/OnSubscribeBroadcastRegister;
.super Ljava/lang/Object;
.source "OnSubscribeBroadcastRegister.java"

# interfaces
.implements Lrx/Observable$OnSubscribe;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/Observable$OnSubscribe",
        "<",
        "Landroid/content/Intent;",
        ">;"
    }
.end annotation


# instance fields
.field private final broadcastPermission:Ljava/lang/String;

.field private final context:Landroid/content/Context;

.field private final intentFilter:Landroid/content/IntentFilter;

.field private final schedulerHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intentFilter"    # Landroid/content/IntentFilter;
    .param p3, "broadcastPermission"    # Ljava/lang/String;
    .param p4, "schedulerHandler"    # Landroid/os/Handler;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lrx/android/content/OnSubscribeBroadcastRegister;->context:Landroid/content/Context;

    .line 37
    iput-object p2, p0, Lrx/android/content/OnSubscribeBroadcastRegister;->intentFilter:Landroid/content/IntentFilter;

    .line 38
    iput-object p3, p0, Lrx/android/content/OnSubscribeBroadcastRegister;->broadcastPermission:Ljava/lang/String;

    .line 39
    iput-object p4, p0, Lrx/android/content/OnSubscribeBroadcastRegister;->schedulerHandler:Landroid/os/Handler;

    .line 40
    return-void
.end method

.method static synthetic access$000(Lrx/android/content/OnSubscribeBroadcastRegister;)Landroid/content/Context;
    .registers 2
    .param p0, "x0"    # Lrx/android/content/OnSubscribeBroadcastRegister;

    .prologue
    .line 28
    iget-object v0, p0, Lrx/android/content/OnSubscribeBroadcastRegister;->context:Landroid/content/Context;

    return-object v0
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 28
    check-cast p1, Lrx/Subscriber;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lrx/android/content/OnSubscribeBroadcastRegister;->call(Lrx/Subscriber;)V

    return-void
.end method

.method public call(Lrx/Subscriber;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-",
            "Landroid/content/Intent;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 44
    .local p1, "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-Landroid/content/Intent;>;"
    new-instance v0, Lrx/android/content/OnSubscribeBroadcastRegister$1;

    invoke-direct {v0, p0, p1}, Lrx/android/content/OnSubscribeBroadcastRegister$1;-><init>(Lrx/android/content/OnSubscribeBroadcastRegister;Lrx/Subscriber;)V

    .line 51
    .local v0, "broadcastReceiver":Landroid/content/BroadcastReceiver;
    new-instance v2, Lrx/android/content/OnSubscribeBroadcastRegister$2;

    invoke-direct {v2, p0, v0}, Lrx/android/content/OnSubscribeBroadcastRegister$2;-><init>(Lrx/android/content/OnSubscribeBroadcastRegister;Landroid/content/BroadcastReceiver;)V

    invoke-static {v2}, Lrx/subscriptions/Subscriptions;->create(Lrx/functions/Action0;)Lrx/Subscription;

    move-result-object v1

    .line 58
    .local v1, "subscription":Lrx/Subscription;
    invoke-virtual {p1, v1}, Lrx/Subscriber;->add(Lrx/Subscription;)V

    .line 59
    iget-object v2, p0, Lrx/android/content/OnSubscribeBroadcastRegister;->context:Landroid/content/Context;

    iget-object v3, p0, Lrx/android/content/OnSubscribeBroadcastRegister;->intentFilter:Landroid/content/IntentFilter;

    iget-object v4, p0, Lrx/android/content/OnSubscribeBroadcastRegister;->broadcastPermission:Ljava/lang/String;

    iget-object v5, p0, Lrx/android/content/OnSubscribeBroadcastRegister;->schedulerHandler:Landroid/os/Handler;

    invoke-virtual {v2, v0, v3, v4, v5}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 61
    return-void
.end method
