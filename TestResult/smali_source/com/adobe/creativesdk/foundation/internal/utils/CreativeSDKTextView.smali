.class public Lcom/adobe/creativesdk/foundation/internal/utils/CreativeSDKTextView;
.super Landroid/widget/TextView;
.source "CreativeSDKTextView.java"


# static fields
.field private static _csdkadobeCleanFont:Landroid/graphics/Typeface;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 36
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/CreativeSDKTextView;->_csdkadobeCleanFont:Landroid/graphics/Typeface;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 55
    invoke-direct {p0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 58
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 60
    invoke-direct {p0, p1, p2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 61
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 67
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 69
    return-void
.end method


# virtual methods
.method public setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
    .registers 2
    .param p1, "where"    # Landroid/text/TextUtils$TruncateAt;

    .prologue
    .line 64
    invoke-super {p0, p1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 65
    return-void
.end method

.method public setTypeface(Landroid/graphics/Typeface;)V
    .registers 4
    .param p1, "tf"    # Landroid/graphics/Typeface;

    .prologue
    .line 73
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/CreativeSDKTextView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKTypeFace;->getTypeface(Landroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object v0

    .line 74
    .local v0, "_adobefont":Landroid/graphics/Typeface;
    invoke-super {p0, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 75
    return-void
.end method
