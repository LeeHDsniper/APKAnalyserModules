.class Lrx/android/content/OnSubscribeLocalBroadcastRegister$1;
.super Landroid/content/BroadcastReceiver;
.source "OnSubscribeLocalBroadcastRegister.java"


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

.field final synthetic val$subscriber:Lrx/Subscriber;


# direct methods
.method constructor <init>(Lrx/android/content/OnSubscribeLocalBroadcastRegister;Lrx/Subscriber;)V
    .registers 3

    .prologue
    .line 41
    iput-object p1, p0, Lrx/android/content/OnSubscribeLocalBroadcastRegister$1;->this$0:Lrx/android/content/OnSubscribeLocalBroadcastRegister;

    iput-object p2, p0, Lrx/android/content/OnSubscribeLocalBroadcastRegister$1;->val$subscriber:Lrx/Subscriber;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 44
    iget-object v0, p0, Lrx/android/content/OnSubscribeLocalBroadcastRegister$1;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {v0, p2}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 45
    return-void
.end method
