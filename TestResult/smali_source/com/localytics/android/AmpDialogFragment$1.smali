.class Lcom/localytics/android/AmpDialogFragment$1;
.super Lcom/localytics/android/AmpCallable;
.source "AmpDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/AmpDialogFragment;->setJavaScriptClient(Lcom/localytics/android/JavaScriptClient;)Lcom/localytics/android/AmpDialogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/localytics/android/AmpDialogFragment;


# direct methods
.method constructor <init>(Lcom/localytics/android/AmpDialogFragment;)V
    .registers 2

    .prologue
    .line 310
    iput-object p1, p0, Lcom/localytics/android/AmpDialogFragment$1;->this$0:Lcom/localytics/android/AmpDialogFragment;

    invoke-direct {p0}, Lcom/localytics/android/AmpCallable;-><init>()V

    return-void
.end method


# virtual methods
.method call([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    .line 314
    const/4 v2, 0x0

    aget-object v1, p1, v2

    check-cast v1, Ljava/lang/String;

    .line 315
    .local v1, "url":Ljava/lang/String;
    iget-object v2, p0, Lcom/localytics/android/AmpDialogFragment$1;->this$0:Lcom/localytics/android/AmpDialogFragment;

    # getter for: Lcom/localytics/android/AmpDialogFragment;->mAmpDialog:Lcom/localytics/android/AmpDialogFragment$AmpDialog;
    invoke-static {v2}, Lcom/localytics/android/AmpDialogFragment;->access$000(Lcom/localytics/android/AmpDialogFragment;)Lcom/localytics/android/AmpDialogFragment$AmpDialog;

    move-result-object v2

    # getter for: Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mWebView:Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;
    invoke-static {v2}, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->access$100(Lcom/localytics/android/AmpDialogFragment$AmpDialog;)Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;

    move-result-object v0

    .line 316
    .local v0, "mWebView":Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;
    iget-object v2, p0, Lcom/localytics/android/AmpDialogFragment$1;->this$0:Lcom/localytics/android/AmpDialogFragment;

    iget-object v3, p0, Lcom/localytics/android/AmpDialogFragment$1;->this$0:Lcom/localytics/android/AmpDialogFragment;

    invoke-virtual {v3}, Lcom/localytics/android/AmpDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Lcom/localytics/android/AmpDialogFragment;->handleUrl(Ljava/lang/String;Landroid/app/Activity;)Z

    move-result v2

    if-eqz v2, :cond_2e

    .line 318
    new-instance v2, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v3, Lcom/localytics/android/AmpDialogFragment$1$1;

    invoke-direct {v3, p0, v0, v1}, Lcom/localytics/android/AmpDialogFragment$1$1;-><init>(Lcom/localytics/android/AmpDialogFragment$1;Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 326
    :cond_2e
    const/4 v2, 0x0

    return-object v2
.end method
