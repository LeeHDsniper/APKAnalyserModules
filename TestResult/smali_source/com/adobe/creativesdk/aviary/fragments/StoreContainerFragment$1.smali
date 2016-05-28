.class Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$1;
.super Ljava/lang/Object;
.source "StoreContainerFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnKeyListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->onResume()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;

    .prologue
    .line 84
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$1;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onKey(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .registers 10
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v5, 0x1

    const/4 v0, 0x0

    .line 88
    sget-object v1, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "onKey: %d"

    new-array v3, v5, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v0

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 90
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    if-ne v1, v5, :cond_20

    .line 91
    const/4 v1, 0x4

    if-ne p2, v1, :cond_20

    .line 92
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$1;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->onBackPressed()Z

    move-result v0

    .line 96
    :cond_20
    return v0
.end method
