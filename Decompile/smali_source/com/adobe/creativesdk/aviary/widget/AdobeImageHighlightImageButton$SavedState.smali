.class Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$SavedState;
.super Landroid/view/View$BaseSavedState;
.source "AdobeImageHighlightImageButton.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SavedState"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$SavedState;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field checked:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 354
    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$SavedState$1;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$SavedState$1;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$SavedState;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .registers 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 372
    invoke-direct {p0, p1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcel;)V

    .line 373
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readValue(Ljava/lang/ClassLoader;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$SavedState;->checked:Z

    .line 374
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$1;

    .prologue
    .line 353
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$SavedState;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method constructor <init>(Landroid/os/Parcelable;)V
    .registers 2
    .param p1, "superState"    # Landroid/os/Parcelable;

    .prologue
    .line 368
    invoke-direct {p0, p1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcelable;)V

    .line 369
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 384
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CompoundButton.SavedState{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " checked="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$SavedState;->checked:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 378
    invoke-super {p0, p1, p2}, Landroid/view/View$BaseSavedState;->writeToParcel(Landroid/os/Parcel;I)V

    .line 379
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$SavedState;->checked:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeValue(Ljava/lang/Object;)V

    .line 380
    return-void
.end method
