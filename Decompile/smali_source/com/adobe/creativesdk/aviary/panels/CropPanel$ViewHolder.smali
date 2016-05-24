.class final Lcom/adobe/creativesdk/aviary/panels/CropPanel$ViewHolder;
.super Ljava/lang/Object;
.source "CropPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/CropPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ViewHolder"
.end annotation


# instance fields
.field imageView:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

.field textView:Landroid/widget/TextView;


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 266
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/adobe/creativesdk/aviary/panels/CropPanel$1;)V
    .registers 2
    .param p1, "x0"    # Lcom/adobe/creativesdk/aviary/panels/CropPanel$1;

    .prologue
    .line 266
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/CropPanel$ViewHolder;-><init>()V

    return-void
.end method
