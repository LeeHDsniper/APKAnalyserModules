.class Lcom/adobe/creativesdk/aviary/panels/BordersPanel$2;
.super Ljava/lang/Object;
.source "BordersPanel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->createTutorialOverlayIfNecessary()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/panels/BordersPanel;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    .prologue
    .line 662
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$2;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 665
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$2;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    # invokes: Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->createTutorialOverlayIfNecessaryDelayed()Z
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->access$000(Lcom/adobe/creativesdk/aviary/panels/BordersPanel;)Z

    .line 666
    return-void
.end method
