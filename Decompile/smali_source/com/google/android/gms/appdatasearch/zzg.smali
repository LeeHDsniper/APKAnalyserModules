.class public Lcom/google/android/gms/appdatasearch/zzg;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static zza(Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;Landroid/os/Parcel;I)V
    .registers 7

    const/4 v3, 0x0

    invoke-static {p1}, Lcom/google/android/gms/common/internal/safeparcel/zzb;->zzak(Landroid/os/Parcel;)I

    move-result v0

    const/16 v1, 0x3e8

    iget v2, p0, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;->mVersionCode:I

    invoke-static {p1, v1, v2}, Lcom/google/android/gms/common/internal/safeparcel/zzb;->zzc(Landroid/os/Parcel;II)V

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;->zzPv:Lcom/google/android/gms/common/api/Status;

    invoke-static {p1, v1, v2, p2, v3}, Lcom/google/android/gms/common/internal/safeparcel/zzb;->zza(Landroid/os/Parcel;ILandroid/os/Parcelable;IZ)V

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;->zzPw:Ljava/util/List;

    invoke-static {p1, v1, v2, v3}, Lcom/google/android/gms/common/internal/safeparcel/zzb;->zzc(Landroid/os/Parcel;ILjava/util/List;Z)V

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;->zzPx:[Ljava/lang/String;

    invoke-static {p1, v1, v2, v3}, Lcom/google/android/gms/common/internal/safeparcel/zzb;->zza(Landroid/os/Parcel;I[Ljava/lang/String;Z)V

    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/safeparcel/zzb;->zzH(Landroid/os/Parcel;I)V

    return-void
.end method


# virtual methods
.method public synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Landroid/os/Parcel;

    .prologue
    invoke-virtual {p0, p1}, Lcom/google/android/gms/appdatasearch/zzg;->zzx(Landroid/os/Parcel;)Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;

    move-result-object v0

    return-object v0
.end method

.method public synthetic newArray(I)[Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    invoke-virtual {p0, p1}, Lcom/google/android/gms/appdatasearch/zzg;->zzai(I)[Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;

    move-result-object v0

    return-object v0
.end method

.method public zzai(I)[Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;
    .registers 3

    new-array v0, p1, [Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;

    return-object v0
.end method

.method public zzx(Landroid/os/Parcel;)Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;
    .registers 10

    const/4 v1, 0x0

    invoke-static {p1}, Lcom/google/android/gms/common/internal/safeparcel/zza;->zzaj(Landroid/os/Parcel;)I

    move-result v5

    const/4 v4, 0x0

    move-object v2, v1

    move-object v3, v1

    :goto_8
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    if-ge v0, v5, :cond_51

    invoke-static {p1}, Lcom/google/android/gms/common/internal/safeparcel/zza;->zzai(Landroid/os/Parcel;)I

    move-result v0

    invoke-static {v0}, Lcom/google/android/gms/common/internal/safeparcel/zza;->zzbH(I)I

    move-result v6

    sparse-switch v6, :sswitch_data_76

    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/safeparcel/zza;->zzb(Landroid/os/Parcel;I)V

    move-object v0, v1

    move-object v1, v2

    move-object v2, v3

    move v3, v4

    :goto_20
    move v4, v3

    move-object v3, v2

    move-object v2, v1

    move-object v1, v0

    goto :goto_8

    :sswitch_25
    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/safeparcel/zza;->zzg(Landroid/os/Parcel;I)I

    move-result v0

    move-object v7, v1

    move-object v1, v2

    move-object v2, v3

    move v3, v0

    move-object v0, v7

    goto :goto_20

    :sswitch_2f
    sget-object v3, Lcom/google/android/gms/common/api/Status;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {p1, v0, v3}, Lcom/google/android/gms/common/internal/safeparcel/zza;->zza(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/Status;

    move v3, v4

    move-object v7, v2

    move-object v2, v0

    move-object v0, v1

    move-object v1, v7

    goto :goto_20

    :sswitch_3d
    sget-object v2, Lcom/google/android/gms/appdatasearch/UsageInfo;->CREATOR:Lcom/google/android/gms/appdatasearch/zzj;

    invoke-static {p1, v0, v2}, Lcom/google/android/gms/common/internal/safeparcel/zza;->zzc(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object v0

    move-object v2, v3

    move v3, v4

    move-object v7, v1

    move-object v1, v0

    move-object v0, v7

    goto :goto_20

    :sswitch_49
    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/safeparcel/zza;->zzA(Landroid/os/Parcel;I)[Ljava/lang/String;

    move-result-object v0

    move-object v1, v2

    move-object v2, v3

    move v3, v4

    goto :goto_20

    :cond_51
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    if-eq v0, v5, :cond_70

    new-instance v0, Lcom/google/android/gms/common/internal/safeparcel/zza$zza;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Overread allowed size end="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/google/android/gms/common/internal/safeparcel/zza$zza;-><init>(Ljava/lang/String;Landroid/os/Parcel;)V

    throw v0

    :cond_70
    new-instance v0, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;

    invoke-direct {v0, v4, v3, v2, v1}, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;-><init>(ILcom/google/android/gms/common/api/Status;Ljava/util/List;[Ljava/lang/String;)V

    return-object v0

    :sswitch_data_76
    .sparse-switch
        0x1 -> :sswitch_2f
        0x2 -> :sswitch_3d
        0x3 -> :sswitch_49
        0x3e8 -> :sswitch_25
    .end sparse-switch
.end method
