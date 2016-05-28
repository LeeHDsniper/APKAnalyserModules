.class Lrx/android/content/OnSubscribeBroadcastRegister$2;
.super Ljava/lang/Object;
.source "OnSubscribeBroadcastRegister.java"

# interfaces
.implements Lrx/functions/Action0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/android/content/OnSubscribeBroadcastRegister;->call(Lrx/Subscriber;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lrx/android/content/OnSubscribeBroadcastRegister;

.field final synthetic val$broadcastReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method constructor <init>(Lrx/android/content/OnSubscribeBroadcastRegister;Landroid/content/BroadcastReceiver;)V
    .registers 3

    .prologue
    .line 51
    iput-object p1, p0, Lrx/android/content/OnSubscribeBroadcastRegister$2;->this$0:Lrx/android/content/OnSubscribeBroadcastRegister;

    iput-object p2, p0, Lrx/android/content/OnSubscribeBroadcastRegister$2;->val$broadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()V
    .registers 3

    .prologue
    .line 54
    iget-object v0, p0, Lrx/android/content/OnSubscribeBroadcastRegister$2;->this$0:Lrx/android/content/OnSubscribeBroadcastRegister;

    # getter for: Lrx/android/content/OnSubscribeBroadcastRegister;->context:Landroid/content/Context;
    invoke-static {v0}, Lrx/android/content/OnSubscribeBroadcastRegister;->access$000(Lrx/android/content/OnSubscribeBroadcastRegister;)Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lrx/android/content/OnSubscribeBroadcastRegister$2;->val$broadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 55
    return-void
.end method
