.class Lrx/android/content/OnSubscribeLocalBroadcastRegister$2;
.super Ljava/lang/Object;
.source "OnSubscribeLocalBroadcastRegister.java"

# interfaces
.implements Lrx/functions/Action0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/android/content/OnSubscribeLocalBroadcastRegister;->call(Lrx/Subscriber;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lrx/android/content/OnSubscribeLocalBroadcastRegister;

.field final synthetic val$broadcastReceiver:Landroid/content/BroadcastReceiver;

.field final synthetic val$localBroadcastManager:Landroid/support/v4/content/LocalBroadcastManager;


# direct methods
.method constructor <init>(Lrx/android/content/OnSubscribeLocalBroadcastRegister;Landroid/support/v4/content/LocalBroadcastManager;Landroid/content/BroadcastReceiver;)V
    .registers 4

    .prologue
    .line 48
    iput-object p1, p0, Lrx/android/content/OnSubscribeLocalBroadcastRegister$2;->this$0:Lrx/android/content/OnSubscribeLocalBroadcastRegister;

    iput-object p2, p0, Lrx/android/content/OnSubscribeLocalBroadcastRegister$2;->val$localBroadcastManager:Landroid/support/v4/content/LocalBroadcastManager;

    iput-object p3, p0, Lrx/android/content/OnSubscribeLocalBroadcastRegister$2;->val$broadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()V
    .registers 3

    .prologue
    .line 51
    iget-object v0, p0, Lrx/android/content/OnSubscribeLocalBroadcastRegister$2;->val$localBroadcastManager:Landroid/support/v4/content/LocalBroadcastManager;

    iget-object v1, p0, Lrx/android/content/OnSubscribeLocalBroadcastRegister$2;->val$broadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/support/v4/content/LocalBroadcastManager;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 52
    return-void
.end method
