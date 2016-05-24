.class Lrx/android/content/OnSubscribeBroadcastRegister$1;
.super Landroid/content/BroadcastReceiver;
.source "OnSubscribeBroadcastRegister.java"


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

.field final synthetic val$subscriber:Lrx/Subscriber;


# direct methods
.method constructor <init>(Lrx/android/content/OnSubscribeBroadcastRegister;Lrx/Subscriber;)V
    .registers 3

    .prologue
    .line 44
    iput-object p1, p0, Lrx/android/content/OnSubscribeBroadcastRegister$1;->this$0:Lrx/android/content/OnSubscribeBroadcastRegister;

    iput-object p2, p0, Lrx/android/content/OnSubscribeBroadcastRegister$1;->val$subscriber:Lrx/Subscriber;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 47
    iget-object v0, p0, Lrx/android/content/OnSubscribeBroadcastRegister$1;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {v0, p2}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 48
    return-void
.end method
