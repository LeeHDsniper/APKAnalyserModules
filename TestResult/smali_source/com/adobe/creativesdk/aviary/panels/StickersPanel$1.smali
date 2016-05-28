.class Lcom/adobe/creativesdk/aviary/panels/StickersPanel$1;
.super Landroid/database/ContentObserver;
.source "StickersPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/StickersPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/panels/StickersPanel;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/panels/StickersPanel;Landroid/os/Handler;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/panels/StickersPanel;
    .param p2, "x0"    # Landroid/os/Handler;

    .prologue
    .line 144
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/StickersPanel;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .registers 4
    .param p1, "selfChange"    # Z

    .prologue
    .line 147
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/StickersPanel;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "mContentObserver::onChange"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 148
    invoke-super {p0, p1}, Landroid/database/ContentObserver;->onChange(Z)V

    .line 150
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/StickersPanel;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->isActive()Z

    move-result v0

    if-eqz v0, :cond_2b

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/StickersPanel;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mCursorLoaderPacks:Landroid/support/v4/content/CursorLoader;

    if-eqz v0, :cond_2b

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/StickersPanel;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mCursorLoaderPacks:Landroid/support/v4/content/CursorLoader;

    invoke-virtual {v0}, Landroid/support/v4/content/CursorLoader;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_2b

    .line 151
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/StickersPanel;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mCursorLoaderPacks:Landroid/support/v4/content/CursorLoader;

    invoke-virtual {v0}, Landroid/support/v4/content/CursorLoader;->onContentChanged()V

    .line 153
    :cond_2b
    return-void
.end method
