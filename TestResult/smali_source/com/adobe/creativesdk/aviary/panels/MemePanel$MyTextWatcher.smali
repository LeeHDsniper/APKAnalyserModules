.class abstract Lcom/adobe/creativesdk/aviary/panels/MemePanel$MyTextWatcher;
.super Ljava/lang/Object;
.source "MemePanel.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/MemePanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x400
    name = "MyTextWatcher"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/panels/MemePanel;

.field public view:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/panels/MemePanel;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/panels/MemePanel;

    .prologue
    .line 409
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel$MyTextWatcher;->this$0:Lcom/adobe/creativesdk/aviary/panels/MemePanel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
