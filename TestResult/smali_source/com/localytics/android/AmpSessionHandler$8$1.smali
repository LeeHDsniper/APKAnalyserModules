.class Lcom/localytics/android/AmpSessionHandler$8$1;
.super Landroid/os/AsyncTask;
.source "AmpSessionHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/AmpSessionHandler$8;->call([Ljava/lang/Object;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/util/Map",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Object;",
        ">;",
        "Ljava/lang/Void;",
        "Ljava/util/Map",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Object;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/localytics/android/AmpSessionHandler$8;

.field final synthetic val$ampMessage:Ljava/util/Map;


# direct methods
.method constructor <init>(Lcom/localytics/android/AmpSessionHandler$8;Ljava/util/Map;)V
    .registers 3

    .prologue
    .line 475
    iput-object p1, p0, Lcom/localytics/android/AmpSessionHandler$8$1;->this$1:Lcom/localytics/android/AmpSessionHandler$8;

    iput-object p2, p0, Lcom/localytics/android/AmpSessionHandler$8$1;->val$ampMessage:Ljava/util/Map;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 475
    check-cast p1, [Ljava/util/Map;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/localytics/android/AmpSessionHandler$8$1;->doInBackground([Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/util/Map;)Ljava/util/Map;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .local p1, "params":[Ljava/util/Map;, "[Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v2, 0x0

    .line 490
    iget-object v0, p0, Lcom/localytics/android/AmpSessionHandler$8$1;->this$1:Lcom/localytics/android/AmpSessionHandler$8;

    iget-object v0, v0, Lcom/localytics/android/AmpSessionHandler$8;->this$0:Lcom/localytics/android/AmpSessionHandler;

    aget-object v1, p1, v2

    # invokes: Lcom/localytics/android/AmpSessionHandler;->updateDisplayingCandidate(Ljava/util/Map;)Z
    invoke-static {v0, v1}, Lcom/localytics/android/AmpSessionHandler;->access$300(Lcom/localytics/android/AmpSessionHandler;Ljava/util/Map;)Z

    move-result v0

    if-eqz v0, :cond_10

    aget-object v0, p1, v2

    :goto_f
    return-object v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 475
    check-cast p1, Ljava/util/Map;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/localytics/android/AmpSessionHandler$8$1;->onPostExecute(Ljava/util/Map;)V

    return-void
.end method

.method protected onPostExecute(Ljava/util/Map;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 498
    .local p1, "result":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    if-nez p1, :cond_13

    .line 500
    :try_start_2
    iget-object v2, p0, Lcom/localytics/android/AmpSessionHandler$8$1;->this$1:Lcom/localytics/android/AmpSessionHandler$8;

    iget-object v2, v2, Lcom/localytics/android/AmpSessionHandler$8;->this$0:Lcom/localytics/android/AmpSessionHandler;

    iget-object v2, v2, Lcom/localytics/android/AmpSessionHandler;->mContext:Landroid/content/Context;

    const-string v3, "The downloaded campaign file is broken."

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 534
    :cond_12
    :goto_12
    return-void

    .line 504
    :cond_13
    iget-object v2, p0, Lcom/localytics/android/AmpSessionHandler$8$1;->this$1:Lcom/localytics/android/AmpSessionHandler$8;

    iget-object v2, v2, Lcom/localytics/android/AmpSessionHandler$8;->this$0:Lcom/localytics/android/AmpSessionHandler;

    # getter for: Lcom/localytics/android/AmpSessionHandler;->mFragmentManager:Landroid/support/v4/app/FragmentManager;
    invoke-static {v2}, Lcom/localytics/android/AmpSessionHandler;->access$000(Lcom/localytics/android/AmpSessionHandler;)Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    if-eqz v2, :cond_12

    iget-object v2, p0, Lcom/localytics/android/AmpSessionHandler$8$1;->this$1:Lcom/localytics/android/AmpSessionHandler$8;

    iget-object v2, v2, Lcom/localytics/android/AmpSessionHandler$8;->this$0:Lcom/localytics/android/AmpSessionHandler;

    # getter for: Lcom/localytics/android/AmpSessionHandler;->mFragmentManager:Landroid/support/v4/app/FragmentManager;
    invoke-static {v2}, Lcom/localytics/android/AmpSessionHandler;->access$000(Lcom/localytics/android/AmpSessionHandler;)Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "amp_dialog"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "campaign_id"

    invoke-interface {p1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v2

    if-nez v2, :cond_12

    .line 509
    invoke-static {}, Lcom/localytics/android/AmpDialogFragment;->newInstance()Lcom/localytics/android/AmpDialogFragment;

    move-result-object v1

    .line 510
    .local v1, "fragment":Lcom/localytics/android/AmpDialogFragment;
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/localytics/android/AmpDialogFragment;->setRetainInstance(Z)V

    .line 511
    invoke-virtual {v1, p1}, Lcom/localytics/android/AmpDialogFragment;->setData(Ljava/util/Map;)Lcom/localytics/android/AmpDialogFragment;

    move-result-object v2

    iget-object v3, p0, Lcom/localytics/android/AmpSessionHandler$8$1;->this$1:Lcom/localytics/android/AmpSessionHandler$8;

    iget-object v3, v3, Lcom/localytics/android/AmpSessionHandler$8;->this$0:Lcom/localytics/android/AmpSessionHandler;

    invoke-virtual {v3}, Lcom/localytics/android/AmpSessionHandler;->getDialogCallbacks()Ljava/util/Map;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/localytics/android/AmpDialogFragment;->setCallbacks(Ljava/util/Map;)Lcom/localytics/android/AmpDialogFragment;

    move-result-object v2

    new-instance v3, Lcom/localytics/android/JavaScriptClient;

    iget-object v4, p0, Lcom/localytics/android/AmpSessionHandler$8$1;->this$1:Lcom/localytics/android/AmpSessionHandler$8;

    iget-object v4, v4, Lcom/localytics/android/AmpSessionHandler$8;->this$0:Lcom/localytics/android/AmpSessionHandler;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lcom/localytics/android/AmpSessionHandler;->getJavaScriptClientCallbacks(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/localytics/android/JavaScriptClient;-><init>(Ljava/util/Map;)V

    invoke-virtual {v2, v3}, Lcom/localytics/android/AmpDialogFragment;->setJavaScriptClient(Lcom/localytics/android/JavaScriptClient;)Lcom/localytics/android/AmpDialogFragment;

    move-result-object v2

    iget-object v3, p0, Lcom/localytics/android/AmpSessionHandler$8$1;->this$1:Lcom/localytics/android/AmpSessionHandler$8;

    iget-object v3, v3, Lcom/localytics/android/AmpSessionHandler$8;->this$0:Lcom/localytics/android/AmpSessionHandler;

    # getter for: Lcom/localytics/android/AmpSessionHandler;->mFragmentManager:Landroid/support/v4/app/FragmentManager;
    invoke-static {v3}, Lcom/localytics/android/AmpSessionHandler;->access$000(Lcom/localytics/android/AmpSessionHandler;)Landroid/support/v4/app/FragmentManager;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "amp_dialog"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "campaign_id"

    invoke-interface {p1, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/localytics/android/AmpDialogFragment;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 520
    iget-object v2, p0, Lcom/localytics/android/AmpSessionHandler$8$1;->this$1:Lcom/localytics/android/AmpSessionHandler$8;

    iget-object v2, v2, Lcom/localytics/android/AmpSessionHandler$8;->this$0:Lcom/localytics/android/AmpSessionHandler;

    # getter for: Lcom/localytics/android/AmpSessionHandler;->mFragmentManager:Landroid/support/v4/app/FragmentManager;
    invoke-static {v2}, Lcom/localytics/android/AmpSessionHandler;->access$000(Lcom/localytics/android/AmpSessionHandler;)Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentManager;->executePendingTransactions()Z
    :try_end_9d
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_9d} :catch_9f

    goto/16 :goto_12

    .line 522
    .end local v1    # "fragment":Lcom/localytics/android/AmpDialogFragment;
    :catch_9f
    move-exception v0

    .line 524
    .local v0, "e":Ljava/lang/Exception;
    sget-boolean v2, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v2, :cond_12

    .line 526
    const-string v2, "Localytics"

    const-string v3, "Localytics library threw an uncaught exception"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_12
.end method

.method protected onPreExecute()V
    .registers 6

    .prologue
    .line 479
    iget-object v2, p0, Lcom/localytics/android/AmpSessionHandler$8$1;->val$ampMessage:Ljava/util/Map;

    const-string v3, "_id"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 480
    .local v1, "ruleId":I
    iget-object v2, p0, Lcom/localytics/android/AmpSessionHandler$8$1;->this$1:Lcom/localytics/android/AmpSessionHandler$8;

    iget-object v2, v2, Lcom/localytics/android/AmpSessionHandler$8;->this$0:Lcom/localytics/android/AmpSessionHandler;

    iget-object v3, p0, Lcom/localytics/android/AmpSessionHandler$8$1;->val$ampMessage:Ljava/util/Map;

    # invokes: Lcom/localytics/android/AmpSessionHandler;->getRemoteFileURL(Ljava/util/Map;)Ljava/lang/String;
    invoke-static {v2, v3}, Lcom/localytics/android/AmpSessionHandler;->access$100(Lcom/localytics/android/AmpSessionHandler;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v2

    const-string v3, ".zip"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    .line 481
    .local v0, "isZipped":Z
    iget-object v2, p0, Lcom/localytics/android/AmpSessionHandler$8$1;->this$1:Lcom/localytics/android/AmpSessionHandler$8;

    iget-object v2, v2, Lcom/localytics/android/AmpSessionHandler$8;->this$0:Lcom/localytics/android/AmpSessionHandler;

    # invokes: Lcom/localytics/android/AmpSessionHandler;->doesCreativeExist(IZ)Z
    invoke-static {v2, v1, v0}, Lcom/localytics/android/AmpSessionHandler;->access$200(Lcom/localytics/android/AmpSessionHandler;IZ)Z

    move-result v2

    if-nez v2, :cond_38

    .line 483
    iget-object v2, p0, Lcom/localytics/android/AmpSessionHandler$8$1;->this$1:Lcom/localytics/android/AmpSessionHandler$8;

    iget-object v2, v2, Lcom/localytics/android/AmpSessionHandler$8;->this$0:Lcom/localytics/android/AmpSessionHandler;

    iget-object v2, v2, Lcom/localytics/android/AmpSessionHandler;->mContext:Landroid/content/Context;

    const-string v3, "Downloading the campaign...\nIt\'ll be shown in few seconds."

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 485
    :cond_38
    return-void
.end method
