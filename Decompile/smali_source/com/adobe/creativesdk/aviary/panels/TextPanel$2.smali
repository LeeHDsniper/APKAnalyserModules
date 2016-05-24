.class Lcom/adobe/creativesdk/aviary/panels/TextPanel$2;
.super Ljava/lang/Object;
.source "TextPanel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/panels/TextPanel;->onActivate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/panels/TextPanel;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/panels/TextPanel;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/panels/TextPanel;

    .prologue
    .line 414
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel$2;->this$0:Lcom/adobe/creativesdk/aviary/panels/TextPanel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 417
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel$2;->this$0:Lcom/adobe/creativesdk/aviary/panels/TextPanel;

    # invokes: Lcom/adobe/creativesdk/aviary/panels/TextPanel;->onAddNewText()V
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->access$000(Lcom/adobe/creativesdk/aviary/panels/TextPanel;)V

    .line 418
    return-void
.end method
