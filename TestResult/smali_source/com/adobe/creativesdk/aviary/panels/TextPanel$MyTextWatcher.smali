.class abstract Lcom/adobe/creativesdk/aviary/panels/TextPanel$MyTextWatcher;
.super Ljava/lang/Object;
.source "TextPanel.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/TextPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x400
    name = "MyTextWatcher"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/panels/TextPanel;

.field public view:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/panels/TextPanel;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/panels/TextPanel;

    .prologue
    .line 59
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel$MyTextWatcher;->this$0:Lcom/adobe/creativesdk/aviary/panels/TextPanel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
