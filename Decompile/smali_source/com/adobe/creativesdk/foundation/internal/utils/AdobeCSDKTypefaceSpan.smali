.class public Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKTypefaceSpan;
.super Landroid/text/style/TypefaceSpan;
.source "AdobeCSDKTypefaceSpan.java"


# instance fields
.field private final newType:Landroid/graphics/Typeface;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/graphics/Typeface;)V
    .registers 3
    .param p1, "family"    # Ljava/lang/String;
    .param p2, "type"    # Landroid/graphics/Typeface;

    .prologue
    .line 29
    invoke-direct {p0, p1}, Landroid/text/style/TypefaceSpan;-><init>(Ljava/lang/String;)V

    .line 30
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKTypefaceSpan;->newType:Landroid/graphics/Typeface;

    .line 31
    return-void
.end method

.method private static applyCustomTypeFace(Landroid/graphics/Paint;Landroid/graphics/Typeface;)V
    .registers 6
    .param p0, "paint"    # Landroid/graphics/Paint;
    .param p1, "tf"    # Landroid/graphics/Typeface;

    .prologue
    .line 45
    invoke-virtual {p0}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v1

    .line 46
    .local v1, "old":Landroid/graphics/Typeface;
    if-nez v1, :cond_24

    .line 47
    const/4 v2, 0x0

    .line 52
    .local v2, "oldStyle":I
    :goto_7
    invoke-virtual {p1}, Landroid/graphics/Typeface;->getStyle()I

    move-result v3

    xor-int/lit8 v3, v3, -0x1

    and-int v0, v2, v3

    .line 53
    .local v0, "fake":I
    and-int/lit8 v3, v0, 0x1

    if-eqz v3, :cond_17

    .line 54
    const/4 v3, 0x1

    invoke-virtual {p0, v3}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 57
    :cond_17
    and-int/lit8 v3, v0, 0x2

    if-eqz v3, :cond_20

    .line 58
    const/high16 v3, -0x41800000

    invoke-virtual {p0, v3}, Landroid/graphics/Paint;->setTextSkewX(F)V

    .line 61
    :cond_20
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 62
    return-void

    .line 49
    .end local v0    # "fake":I
    .end local v2    # "oldStyle":I
    :cond_24
    invoke-virtual {v1}, Landroid/graphics/Typeface;->getStyle()I

    move-result v2

    .restart local v2    # "oldStyle":I
    goto :goto_7
.end method


# virtual methods
.method public updateDrawState(Landroid/text/TextPaint;)V
    .registers 3
    .param p1, "ds"    # Landroid/text/TextPaint;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKTypefaceSpan;->newType:Landroid/graphics/Typeface;

    invoke-static {p1, v0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKTypefaceSpan;->applyCustomTypeFace(Landroid/graphics/Paint;Landroid/graphics/Typeface;)V

    .line 36
    return-void
.end method

.method public updateMeasureState(Landroid/text/TextPaint;)V
    .registers 3
    .param p1, "paint"    # Landroid/text/TextPaint;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKTypefaceSpan;->newType:Landroid/graphics/Typeface;

    invoke-static {p1, v0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKTypefaceSpan;->applyCustomTypeFace(Landroid/graphics/Paint;Landroid/graphics/Typeface;)V

    .line 41
    return-void
.end method
