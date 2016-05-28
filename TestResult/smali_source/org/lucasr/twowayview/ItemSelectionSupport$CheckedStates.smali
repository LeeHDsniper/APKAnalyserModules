.class Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedStates;
.super Landroid/util/SparseBooleanArray;
.source "ItemSelectionSupport.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/lucasr/twowayview/ItemSelectionSupport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CheckedStates"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedStates;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 413
    new-instance v0, Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedStates$1;

    invoke-direct {v0}, Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedStates$1;-><init>()V

    sput-object v0, Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedStates;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 383
    invoke-direct {p0}, Landroid/util/SparseBooleanArray;-><init>()V

    .line 384
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .registers 8
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v4, 0x1

    .line 386
    invoke-direct {p0}, Landroid/util/SparseBooleanArray;-><init>()V

    .line 387
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 388
    .local v2, "size":I
    if-lez v2, :cond_20

    .line 389
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_b
    if-ge v0, v2, :cond_20

    .line 390
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 391
    .local v1, "key":I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v5

    if-ne v5, v4, :cond_1e

    move v3, v4

    .line 392
    .local v3, "value":Z
    :goto_18
    invoke-virtual {p0, v1, v3}, Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedStates;->put(IZ)V

    .line 389
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 391
    .end local v3    # "value":Z
    :cond_1e
    const/4 v3, 0x0

    goto :goto_18

    .line 395
    .end local v0    # "i":I
    .end local v1    # "key":I
    :cond_20
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lorg/lucasr/twowayview/ItemSelectionSupport$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lorg/lucasr/twowayview/ItemSelectionSupport$1;

    .prologue
    .line 378
    invoke-direct {p0, p1}, Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedStates;-><init>(Landroid/os/Parcel;)V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    .prologue
    .line 399
    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 6
    .param p1, "parcel"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 404
    invoke-virtual {p0}, Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedStates;->size()I

    move-result v1

    .line 405
    .local v1, "size":I
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 407
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    if-ge v0, v1, :cond_20

    .line 408
    invoke-virtual {p0, v0}, Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedStates;->keyAt(I)I

    move-result v2

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 409
    invoke-virtual {p0, v0}, Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedStates;->valueAt(I)Z

    move-result v2

    if-eqz v2, :cond_1e

    const/4 v2, 0x1

    :goto_18
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 407
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 409
    :cond_1e
    const/4 v2, 0x0

    goto :goto_18

    .line 411
    :cond_20
    return-void
.end method
