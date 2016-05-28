.class public final Lcom/google/android/gms/common/images/WebImage;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/google/android/gms/common/images/WebImage;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mVersionCode:I

.field private final zzacb:Landroid/net/Uri;

.field private final zznP:I

.field private final zznQ:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/google/android/gms/common/images/zzb;

    invoke-direct {v0}, Lcom/google/android/gms/common/images/zzb;-><init>()V

    sput-object v0, Lcom/google/android/gms/common/images/WebImage;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(ILandroid/net/Uri;II)V
    .registers 5
    .param p1, "versionCode"    # I
    .param p2, "url"    # Landroid/net/Uri;
    .param p3, "width"    # I
    .param p4, "height"    # I

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/common/images/WebImage;->mVersionCode:I

    iput-object p2, p0, Lcom/google/android/gms/common/images/WebImage;->zzacb:Landroid/net/Uri;

    iput p3, p0, Lcom/google/android/gms/common/images/WebImage;->zznP:I

    iput p4, p0, Lcom/google/android/gms/common/images/WebImage;->zznQ:I

    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p0, p1, :cond_5

    .end local p1    # "other":Ljava/lang/Object;
    :cond_4
    :goto_4
    return v0

    .restart local p1    # "other":Ljava/lang/Object;
    :cond_5
    if-eqz p1, :cond_b

    instance-of v2, p1, Lcom/google/android/gms/common/images/WebImage;

    if-nez v2, :cond_d

    :cond_b
    move v0, v1

    goto :goto_4

    :cond_d
    check-cast p1, Lcom/google/android/gms/common/images/WebImage;

    .end local p1    # "other":Ljava/lang/Object;
    iget-object v2, p0, Lcom/google/android/gms/common/images/WebImage;->zzacb:Landroid/net/Uri;

    iget-object v3, p1, Lcom/google/android/gms/common/images/WebImage;->zzacb:Landroid/net/Uri;

    invoke-static {v2, v3}, Lcom/google/android/gms/common/internal/zzw;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_25

    iget v2, p0, Lcom/google/android/gms/common/images/WebImage;->zznP:I

    iget v3, p1, Lcom/google/android/gms/common/images/WebImage;->zznP:I

    if-ne v2, v3, :cond_25

    iget v2, p0, Lcom/google/android/gms/common/images/WebImage;->zznQ:I

    iget v3, p1, Lcom/google/android/gms/common/images/WebImage;->zznQ:I

    if-eq v2, v3, :cond_4

    :cond_25
    move v0, v1

    goto :goto_4
.end method

.method public getHeight()I
    .registers 2

    iget v0, p0, Lcom/google/android/gms/common/images/WebImage;->zznQ:I

    return v0
.end method

.method public getUrl()Landroid/net/Uri;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/common/images/WebImage;->zzacb:Landroid/net/Uri;

    return-object v0
.end method

.method getVersionCode()I
    .registers 2

    iget v0, p0, Lcom/google/android/gms/common/images/WebImage;->mVersionCode:I

    return v0
.end method

.method public getWidth()I
    .registers 2

    iget v0, p0, Lcom/google/android/gms/common/images/WebImage;->zznP:I

    return v0
.end method

.method public hashCode()I
    .registers 4

    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/google/android/gms/common/images/WebImage;->zzacb:Landroid/net/Uri;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget v2, p0, Lcom/google/android/gms/common/images/WebImage;->zznP:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x2

    iget v2, p0, Lcom/google/android/gms/common/images/WebImage;->zznQ:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzw;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    const-string v0, "Image %dx%d %s"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget v3, p0, Lcom/google/android/gms/common/images/WebImage;->zznP:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget v3, p0, Lcom/google/android/gms/common/images/WebImage;->zznQ:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/google/android/gms/common/images/WebImage;->zzacb:Landroid/net/Uri;

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 3
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    invoke-static {p0, p1, p2}, Lcom/google/android/gms/common/images/zzb;->zza(Lcom/google/android/gms/common/images/WebImage;Landroid/os/Parcel;I)V

    return-void
.end method
