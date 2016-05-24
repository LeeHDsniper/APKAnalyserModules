.class Lcom/adobe/creativesdk/aviary/panels/BordersPanel$1;
.super Landroid/database/ContentObserver;
.source "BordersPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->updateInstalledPacks()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/panels/BordersPanel;Landroid/os/Handler;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/panels/BordersPanel;
    .param p2, "x0"    # Landroid/os/Handler;

    .prologue
    .line 577
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .registers 4
    .param p1, "selfChange"    # Z

    .prologue
    .line 580
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "mContentObserver::onChange"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 581
    invoke-super {p0, p1}, Landroid/database/ContentObserver;->onChange(Z)V

    .line 583
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->isActive()Z

    move-result v0

    if-eqz v0, :cond_2b

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mCursorLoader:Landroid/support/v4/content/CursorLoader;

    if-eqz v0, :cond_2b

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mCursorLoader:Landroid/support/v4/content/CursorLoader;

    invoke-virtual {v0}, Landroid/support/v4/content/CursorLoader;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_2b

    .line 584
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mCursorLoader:Landroid/support/v4/content/CursorLoader;

    invoke-virtual {v0}, Landroid/support/v4/content/CursorLoader;->onContentChanged()V

    .line 586
    :cond_2b
    return-void
.end method
