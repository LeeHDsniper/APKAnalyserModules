.class Lcom/adobe/creativesdk/aviary/panels/StickersPanel$2;
.super Ljava/lang/Object;
.source "StickersPanel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->createTutorialOverlayIfNecessary(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/panels/StickersPanel;

.field final synthetic val$firstValidIndex:I


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/panels/StickersPanel;I)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/panels/StickersPanel;

    .prologue
    .line 325
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$2;->this$0:Lcom/adobe/creativesdk/aviary/panels/StickersPanel;

    iput p2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$2;->val$firstValidIndex:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 328
    iget v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$2;->val$firstValidIndex:I

    if-gez v0, :cond_b

    .line 329
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$2;->this$0:Lcom/adobe/creativesdk/aviary/panels/StickersPanel;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$2;->val$firstValidIndex:I

    # invokes: Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->createTutorialOverlayIfNecessaryDelayed(I)Z
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->access$000(Lcom/adobe/creativesdk/aviary/panels/StickersPanel;I)Z

    .line 331
    :cond_b
    return-void
.end method
