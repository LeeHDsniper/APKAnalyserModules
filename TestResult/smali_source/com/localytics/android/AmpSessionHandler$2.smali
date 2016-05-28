.class Lcom/localytics/android/AmpSessionHandler$2;
.super Ljava/lang/Object;
.source "AmpSessionHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/AmpSessionHandler;->ampTrigger(Ljava/lang/String;Ljava/util/Map;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/localytics/android/AmpSessionHandler;

.field final synthetic val$ampMessage:Ljava/util/Map;

.field final synthetic val$attributes:Ljava/util/Map;


# direct methods
.method constructor <init>(Lcom/localytics/android/AmpSessionHandler;Ljava/util/Map;Ljava/util/Map;)V
    .registers 4

    .prologue
    .line 265
    iput-object p1, p0, Lcom/localytics/android/AmpSessionHandler$2;->this$0:Lcom/localytics/android/AmpSessionHandler;

    iput-object p2, p0, Lcom/localytics/android/AmpSessionHandler$2;->val$ampMessage:Ljava/util/Map;

    iput-object p3, p0, Lcom/localytics/android/AmpSessionHandler$2;->val$attributes:Ljava/util/Map;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 7

    .prologue
    .line 269
    iget-object v2, p0, Lcom/localytics/android/AmpSessionHandler$2;->this$0:Lcom/localytics/android/AmpSessionHandler;

    # getter for: Lcom/localytics/android/AmpSessionHandler;->mFragmentManager:Landroid/support/v4/app/FragmentManager;
    invoke-static {v2}, Lcom/localytics/android/AmpSessionHandler;->access$000(Lcom/localytics/android/AmpSessionHandler;)Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    if-nez v2, :cond_9

    .line 304
    :cond_8
    :goto_8
    return-void

    .line 276
    :cond_9
    :try_start_9
    iget-object v2, p0, Lcom/localytics/android/AmpSessionHandler$2;->this$0:Lcom/localytics/android/AmpSessionHandler;

    # getter for: Lcom/localytics/android/AmpSessionHandler;->mFragmentManager:Landroid/support/v4/app/FragmentManager;
    invoke-static {v2}, Lcom/localytics/android/AmpSessionHandler;->access$000(Lcom/localytics/android/AmpSessionHandler;)Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    const-string v3, "amp_dialog"

    invoke-virtual {v2, v3}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v2

    if-nez v2, :cond_8

    .line 280
    invoke-static {}, Lcom/localytics/android/AmpDialogFragment;->newInstance()Lcom/localytics/android/AmpDialogFragment;

    move-result-object v1

    .line 281
    .local v1, "fragment":Lcom/localytics/android/AmpDialogFragment;
    iget-object v2, p0, Lcom/localytics/android/AmpSessionHandler$2;->val$ampMessage:Ljava/util/Map;

    invoke-virtual {v1, v2}, Lcom/localytics/android/AmpDialogFragment;->setData(Ljava/util/Map;)Lcom/localytics/android/AmpDialogFragment;

    move-result-object v2

    iget-object v3, p0, Lcom/localytics/android/AmpSessionHandler$2;->this$0:Lcom/localytics/android/AmpSessionHandler;

    invoke-virtual {v3}, Lcom/localytics/android/AmpSessionHandler;->getDialogCallbacks()Ljava/util/Map;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/localytics/android/AmpDialogFragment;->setCallbacks(Ljava/util/Map;)Lcom/localytics/android/AmpDialogFragment;

    move-result-object v2

    new-instance v3, Lcom/localytics/android/JavaScriptClient;

    iget-object v4, p0, Lcom/localytics/android/AmpSessionHandler$2;->this$0:Lcom/localytics/android/AmpSessionHandler;

    iget-object v5, p0, Lcom/localytics/android/AmpSessionHandler$2;->val$attributes:Ljava/util/Map;

    invoke-virtual {v4, v5}, Lcom/localytics/android/AmpSessionHandler;->getJavaScriptClientCallbacks(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/localytics/android/JavaScriptClient;-><init>(Ljava/util/Map;)V

    invoke-virtual {v2, v3}, Lcom/localytics/android/AmpDialogFragment;->setJavaScriptClient(Lcom/localytics/android/JavaScriptClient;)Lcom/localytics/android/AmpDialogFragment;

    move-result-object v2

    iget-object v3, p0, Lcom/localytics/android/AmpSessionHandler$2;->this$0:Lcom/localytics/android/AmpSessionHandler;

    # getter for: Lcom/localytics/android/AmpSessionHandler;->mFragmentManager:Landroid/support/v4/app/FragmentManager;
    invoke-static {v3}, Lcom/localytics/android/AmpSessionHandler;->access$000(Lcom/localytics/android/AmpSessionHandler;)Landroid/support/v4/app/FragmentManager;

    move-result-object v3

    const-string v4, "amp_dialog"

    invoke-virtual {v2, v3, v4}, Lcom/localytics/android/AmpDialogFragment;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 290
    iget-object v2, p0, Lcom/localytics/android/AmpSessionHandler$2;->this$0:Lcom/localytics/android/AmpSessionHandler;

    # getter for: Lcom/localytics/android/AmpSessionHandler;->mFragmentManager:Landroid/support/v4/app/FragmentManager;
    invoke-static {v2}, Lcom/localytics/android/AmpSessionHandler;->access$000(Lcom/localytics/android/AmpSessionHandler;)Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentManager;->executePendingTransactions()Z
    :try_end_50
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_50} :catch_51

    goto :goto_8

    .line 292
    .end local v1    # "fragment":Lcom/localytics/android/AmpDialogFragment;
    :catch_51
    move-exception v0

    .line 294
    .local v0, "e":Ljava/lang/Exception;
    sget-boolean v2, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v2, :cond_8

    .line 296
    const-string v2, "Localytics"

    const-string v3, "Localytics library threw an uncaught exception"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_8
.end method
