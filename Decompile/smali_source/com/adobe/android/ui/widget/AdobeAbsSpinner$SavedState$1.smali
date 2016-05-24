.class final Lcom/adobe/android/ui/widget/AdobeAbsSpinner$SavedState$1;
.super Ljava/lang/Object;
.source "AdobeAbsSpinner.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/android/ui/widget/AdobeAbsSpinner$SavedState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Lcom/adobe/android/ui/widget/AdobeAbsSpinner$SavedState;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 375
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/adobe/android/ui/widget/AdobeAbsSpinner$SavedState;
    .registers 4
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 378
    new-instance v0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner$SavedState;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner$SavedState;-><init>(Landroid/os/Parcel;Lcom/adobe/android/ui/widget/AdobeAbsSpinner$1;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 375
    invoke-virtual {p0, p1}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner$SavedState$1;->createFromParcel(Landroid/os/Parcel;)Lcom/adobe/android/ui/widget/AdobeAbsSpinner$SavedState;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/adobe/android/ui/widget/AdobeAbsSpinner$SavedState;
    .registers 3
    .param p1, "size"    # I

    .prologue
    .line 383
    new-array v0, p1, [Lcom/adobe/android/ui/widget/AdobeAbsSpinner$SavedState;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .registers 3

    .prologue
    .line 375
    invoke-virtual {p0, p1}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner$SavedState$1;->newArray(I)[Lcom/adobe/android/ui/widget/AdobeAbsSpinner$SavedState;

    move-result-object v0

    return-object v0
.end method
