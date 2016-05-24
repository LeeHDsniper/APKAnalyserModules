.class Lcom/localytics/android/AmpSessionHandler$7;
.super Lcom/localytics/android/AmpCallable;
.source "AmpSessionHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/AmpSessionHandler;->showAmpTest()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/localytics/android/AmpSessionHandler;


# direct methods
.method constructor <init>(Lcom/localytics/android/AmpSessionHandler;)V
    .registers 2

    .prologue
    .line 445
    iput-object p1, p0, Lcom/localytics/android/AmpSessionHandler$7;->this$0:Lcom/localytics/android/AmpSessionHandler;

    invoke-direct {p0}, Lcom/localytics/android/AmpCallable;-><init>()V

    return-void
.end method


# virtual methods
.method call([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    const/4 v5, 0x1

    .line 449
    iget-object v2, p0, Lcom/localytics/android/AmpSessionHandler$7;->this$0:Lcom/localytics/android/AmpSessionHandler;

    iget-object v2, v2, Lcom/localytics/android/AmpSessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    iget-object v3, p0, Lcom/localytics/android/AmpSessionHandler$7;->this$0:Lcom/localytics/android/AmpSessionHandler;

    iget-object v3, v3, Lcom/localytics/android/AmpSessionHandler;->mApiKey:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/localytics/android/SessionHandler;->getInstallationId(Lcom/localytics/android/LocalyticsProvider;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 451
    .local v1, "installId":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_46

    .line 453
    iget-object v2, p0, Lcom/localytics/android/AmpSessionHandler$7;->this$0:Lcom/localytics/android/AmpSessionHandler;

    iget-object v2, v2, Lcom/localytics/android/AmpSessionHandler;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/localytics/android/AmpSessionHandler$7;->this$0:Lcom/localytics/android/AmpSessionHandler;

    iget-object v3, v3, Lcom/localytics/android/AmpSessionHandler;->mContext:Landroid/content/Context;

    const-string v3, "clipboard"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ClipboardManager;

    .line 454
    .local v0, "clipboard":Landroid/content/ClipboardManager;
    invoke-virtual {v0, v1}, Landroid/content/ClipboardManager;->setText(Ljava/lang/CharSequence;)V

    .line 455
    iget-object v2, p0, Lcom/localytics/android/AmpSessionHandler$7;->this$0:Lcom/localytics/android/AmpSessionHandler;

    iget-object v2, v2, Lcom/localytics/android/AmpSessionHandler;->mContext:Landroid/content/Context;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " has been copied to the clipboard."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 462
    .end local v0    # "clipboard":Landroid/content/ClipboardManager;
    :goto_44
    const/4 v2, 0x0

    return-object v2

    .line 459
    :cond_46
    iget-object v2, p0, Lcom/localytics/android/AmpSessionHandler$7;->this$0:Lcom/localytics/android/AmpSessionHandler;

    iget-object v2, v2, Lcom/localytics/android/AmpSessionHandler;->mContext:Landroid/content/Context;

    const-string v3, "No install id found. Please check your integration."

    invoke-static {v2, v3, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_44
.end method
