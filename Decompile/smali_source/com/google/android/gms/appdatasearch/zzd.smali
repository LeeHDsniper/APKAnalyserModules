.class public Lcom/google/android/gms/appdatasearch/zzd;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Lcom/google/android/gms/appdatasearch/DocumentSection;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static zza(Lcom/google/android/gms/appdatasearch/DocumentSection;Landroid/os/Parcel;I)V
    .registers 7

    const/4 v3, 0x0

    invoke-static {p1}, Lcom/google/android/gms/common/internal/safeparcel/zzb;->zzak(Landroid/os/Parcel;)I

    move-result v0

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/google/android/gms/appdatasearch/DocumentSection;->zzPe:Ljava/lang/String;

    invoke-static {p1, v1, v2, v3}, Lcom/google/android/gms/common/internal/safeparcel/zzb;->zza(Landroid/os/Parcel;ILjava/lang/String;Z)V

    const/16 v1, 0x3e8

    iget v2, p0, Lcom/google/android/gms/appdatasearch/DocumentSection;->mVersionCode:I

    invoke-static {p1, v1, v2}, Lcom/google/android/gms/common/internal/safeparcel/zzb;->zzc(Landroid/os/Parcel;II)V

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/google/android/gms/appdatasearch/DocumentSection;->zzPf:Lcom/google/android/gms/appdatasearch/RegisterSectionInfo;

    invoke-static {p1, v1, v2, p2, v3}, Lcom/google/android/gms/common/internal/safeparcel/zzb;->zza(Landroid/os/Parcel;ILandroid/os/Parcelable;IZ)V

    const/4 v1, 0x4

    iget v2, p0, Lcom/google/android/gms/appdatasearch/DocumentSection;->zzPg:I

    invoke-static {p1, v1, v2}, Lcom/google/android/gms/common/internal/safeparcel/zzb;->zzc(Landroid/os/Parcel;II)V

    const/4 v1, 0x5

    iget-object v2, p0, Lcom/google/android/gms/appdatasearch/DocumentSection;->zzPh:[B

    invoke-static {p1, v1, v2, v3}, Lcom/google/android/gms/common/internal/safeparcel/zzb;->zza(Landroid/os/Parcel;I[BZ)V

    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/safeparcel/zzb;->zzH(Landroid/os/Parcel;I)V

    return-void
.end method


# virtual methods
.method public synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Landroid/os/Parcel;

    .prologue
    invoke-virtual {p0, p1}, Lcom/google/android/gms/appdatasearch/zzd;->zzu(Landroid/os/Parcel;)Lcom/google/android/gms/appdatasearch/DocumentSection;

    move-result-object v0

    return-object v0
.end method

.method public synthetic newArray(I)[Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    invoke-virtual {p0, p1}, Lcom/google/android/gms/appdatasearch/zzd;->zzaf(I)[Lcom/google/android/gms/appdatasearch/DocumentSection;

    move-result-object v0

    return-object v0
.end method

.method public zzaf(I)[Lcom/google/android/gms/appdatasearch/DocumentSection;
    .registers 3

    new-array v0, p1, [Lcom/google/android/gms/appdatasearch/DocumentSection;

    return-object v0
.end method

.method public zzu(Landroid/os/Parcel;)Lcom/google/android/gms/appdatasearch/DocumentSection;
    .registers 10

    const/4 v5, 0x0

    invoke-static {p1}, Lcom/google/android/gms/common/internal/safeparcel/zza;->zzaj(Landroid/os/Parcel;)I

    move-result v6

    const/4 v1, 0x0

    const/4 v4, -0x1

    move-object v3, v5

    move-object v2, v5

    :goto_9
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    if-ge v0, v6, :cond_3c

    invoke-static {p1}, Lcom/google/android/gms/common/internal/safeparcel/zza;->zzai(Landroid/os/Parcel;)I

    move-result v0

    invoke-static {v0}, Lcom/google/android/gms/common/internal/safeparcel/zza;->zzbH(I)I

    move-result v7

    sparse-switch v7, :sswitch_data_62

    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/safeparcel/zza;->zzb(Landroid/os/Parcel;I)V

    goto :goto_9

    :sswitch_1e
    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/safeparcel/zza;->zzo(Landroid/os/Parcel;I)Ljava/lang/String;

    move-result-object v2

    goto :goto_9

    :sswitch_23
    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/safeparcel/zza;->zzg(Landroid/os/Parcel;I)I

    move-result v1

    goto :goto_9

    :sswitch_28
    sget-object v3, Lcom/google/android/gms/appdatasearch/RegisterSectionInfo;->CREATOR:Lcom/google/android/gms/appdatasearch/zzi;

    invoke-static {p1, v0, v3}, Lcom/google/android/gms/common/internal/safeparcel/zza;->zza(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/appdatasearch/RegisterSectionInfo;

    move-object v3, v0

    goto :goto_9

    :sswitch_32
    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/safeparcel/zza;->zzg(Landroid/os/Parcel;I)I

    move-result v4

    goto :goto_9

    :sswitch_37
    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/safeparcel/zza;->zzr(Landroid/os/Parcel;I)[B

    move-result-object v5

    goto :goto_9

    :cond_3c
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    if-eq v0, v6, :cond_5b

    new-instance v0, Lcom/google/android/gms/common/internal/safeparcel/zza$zza;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Overread allowed size end="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/google/android/gms/common/internal/safeparcel/zza$zza;-><init>(Ljava/lang/String;Landroid/os/Parcel;)V

    throw v0

    :cond_5b
    new-instance v0, Lcom/google/android/gms/appdatasearch/DocumentSection;

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/appdatasearch/DocumentSection;-><init>(ILjava/lang/String;Lcom/google/android/gms/appdatasearch/RegisterSectionInfo;I[B)V

    return-object v0

    nop

    :sswitch_data_62
    .sparse-switch
        0x1 -> :sswitch_1e
        0x3 -> :sswitch_28
        0x4 -> :sswitch_32
        0x5 -> :sswitch_37
        0x3e8 -> :sswitch_23
    .end sparse-switch
.end method
