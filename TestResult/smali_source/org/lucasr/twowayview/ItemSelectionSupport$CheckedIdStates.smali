.class Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedIdStates;
.super Landroid/support/v4/util/LongSparseArray;
.source "ItemSelectionSupport.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/lucasr/twowayview/ItemSelectionSupport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CheckedIdStates"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v4/util/LongSparseArray",
        "<",
        "Ljava/lang/Integer;",
        ">;",
        "Landroid/os/Parcelable;"
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedIdStates;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 459
    new-instance v0, Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedIdStates$1;

    invoke-direct {v0}, Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedIdStates$1;-><init>()V

    sput-object v0, Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedIdStates;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 429
    invoke-direct {p0}, Landroid/support/v4/util/LongSparseArray;-><init>()V

    .line 430
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .registers 8
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 432
    invoke-direct {p0}, Landroid/support/v4/util/LongSparseArray;-><init>()V

    .line 433
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 434
    .local v1, "size":I
    if-lez v1, :cond_1e

    .line 435
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_a
    if-ge v0, v1, :cond_1e

    .line 436
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v2

    .line 437
    .local v2, "key":J
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    .line 438
    .local v4, "value":I
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {p0, v2, v3, v5}, Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedIdStates;->put(JLjava/lang/Object;)V

    .line 435
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 441
    .end local v0    # "i":I
    .end local v2    # "key":J
    .end local v4    # "value":I
    :cond_1e
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lorg/lucasr/twowayview/ItemSelectionSupport$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lorg/lucasr/twowayview/ItemSelectionSupport$1;

    .prologue
    .line 427
    invoke-direct {p0, p1}, Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedIdStates;-><init>(Landroid/os/Parcel;)V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    .prologue
    .line 445
    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 7
    .param p1, "parcel"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 450
    invoke-virtual {p0}, Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedIdStates;->size()I

    move-result v1

    .line 451
    .local v1, "size":I
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 453
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    if-ge v0, v1, :cond_21

    .line 454
    invoke-virtual {p0, v0}, Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedIdStates;->keyAt(I)J

    move-result-wide v2

    invoke-virtual {p1, v2, v3}, Landroid/os/Parcel;->writeLong(J)V

    .line 455
    invoke-virtual {p0, v0}, Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedIdStates;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 453
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 457
    :cond_21
    return-void
.end method
