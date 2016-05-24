.class public Lcom/adobe/creativesdk/foundation/internal/utils/CreativeSDKEditText;
.super Landroid/widget/EditText;
.source "CreativeSDKEditText.java"


# static fields
.field private static _csdkadobeCleanFont:Landroid/graphics/Typeface;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 36
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/CreativeSDKEditText;->_csdkadobeCleanFont:Landroid/graphics/Typeface;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 56
    invoke-direct {p0, p1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 57
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 59
    invoke-direct {p0, p1, p2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 60
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 66
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/EditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 67
    return-void
.end method


# virtual methods
.method public setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
    .registers 2
    .param p1, "where"    # Landroid/text/TextUtils$TruncateAt;

    .prologue
    .line 63
    invoke-super {p0, p1}, Landroid/widget/EditText;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 64
    return-void
.end method

.method public setTypeface(Landroid/graphics/Typeface;)V
    .registers 4
    .param p1, "tf"    # Landroid/graphics/Typeface;

    .prologue
    .line 71
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/CreativeSDKEditText;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKTypeFace;->getTypeface(Landroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object v0

    .line 72
    .local v0, "_adobefont":Landroid/graphics/Typeface;
    invoke-super {p0, v0}, Landroid/widget/EditText;->setTypeface(Landroid/graphics/Typeface;)V

    .line 73
    return-void
.end method
