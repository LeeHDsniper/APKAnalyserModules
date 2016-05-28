.class public Lcom/google/android/gms/common/stats/zzg;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Lcom/google/android/gms/common/stats/WakeLockEvent;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static zza(Lcom/google/android/gms/common/stats/WakeLockEvent;Landroid/os/Parcel;I)V
    .registers 8

    const/4 v4, 0x0

    invoke-static {p1}, Lcom/google/android/gms/common/internal/safeparcel/zzb;->zzak(Landroid/os/Parcel;)I

    move-result v0

    const/4 v1, 0x1

    iget v2, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->mVersionCode:I

    invoke-static {p1, v1, v2}, Lcom/google/android/gms/common/internal/safeparcel/zzb;->zzc(Landroid/os/Parcel;II)V

    const/4 v1, 0x2

    invoke-virtual {p0}, Lcom/google/android/gms/common/stats/WakeLockEvent;->getTimeMillis()J

    move-result-wide v2

    invoke-static {p1, v1, v2, v3}, Lcom/google/android/gms/common/internal/safeparcel/zzb;->zza(Landroid/os/Parcel;IJ)V

    const/4 v1, 0x4

    invoke-virtual {p0}, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzpE()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v1, v2, v4}, Lcom/google/android/gms/common/internal/safeparcel/zzb;->zza(Landroid/os/Parcel;ILjava/lang/String;Z)V

    const/4 v1, 0x5

    invoke-virtual {p0}, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzpG()I

    move-result v2

    invoke-static {p1, v1, v2}, Lcom/google/android/gms/common/internal/safeparcel/zzb;->zzc(Landroid/os/Parcel;II)V

    const/4 v1, 0x6

    invoke-virtual {p0}, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzpH()Ljava/util/List;

    move-result-object v2

    invoke-static {p1, v1, v2, v4}, Lcom/google/android/gms/common/internal/safeparcel/zzb;->zzb(Landroid/os/Parcel;ILjava/util/List;Z)V

    const/16 v1, 0x8

    invoke-virtual {p0}, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzpC()J

    move-result-wide v2

    invoke-static {p1, v1, v2, v3}, Lcom/google/android/gms/common/internal/safeparcel/zzb;->zza(Landroid/os/Parcel;IJ)V

    const/16 v1, 0xa

    invoke-virtual {p0}, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzpF()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v1, v2, v4}, Lcom/google/android/gms/common/internal/safeparcel/zzb;->zza(Landroid/os/Parcel;ILjava/lang/String;Z)V

    const/16 v1, 0xb

    invoke-virtual {p0}, Lcom/google/android/gms/common/stats/WakeLockEvent;->getEventType()I

    move-result v2

    invoke-static {p1, v1, v2}, Lcom/google/android/gms/common/internal/safeparcel/zzb;->zzc(Landroid/os/Parcel;II)V

    const/16 v1, 0xc

    invoke-virtual {p0}, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzpA()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v1, v2, v4}, Lcom/google/android/gms/common/internal/safeparcel/zzb;->zza(Landroid/os/Parcel;ILjava/lang/String;Z)V

    const/16 v1, 0xd

    invoke-virtual {p0}, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzpJ()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v1, v2, v4}, Lcom/google/android/gms/common/internal/safeparcel/zzb;->zza(Landroid/os/Parcel;ILjava/lang/String;Z)V

    const/16 v1, 0xe

    invoke-virtual {p0}, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzpI()I

    move-result v2

    invoke-static {p1, v1, v2}, Lcom/google/android/gms/common/internal/safeparcel/zzb;->zzc(Landroid/os/Parcel;II)V

    const/16 v1, 0xf

    invoke-virtual {p0}, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzpK()F

    move-result v2

    invoke-static {p1, v1, v2}, Lcom/google/android/gms/common/internal/safeparcel/zzb;->zza(Landroid/os/Parcel;IF)V

    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/safeparcel/zzb;->zzH(Landroid/os/Parcel;I)V

    return-void
.end method


# virtual methods
.method public synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Landroid/os/Parcel;

    .prologue
    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/stats/zzg;->zzav(Landroid/os/Parcel;)Lcom/google/android/gms/common/stats/WakeLockEvent;

    move-result-object v0

    return-object v0
.end method

.method public synthetic newArray(I)[Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/stats/zzg;->zzbU(I)[Lcom/google/android/gms/common/stats/WakeLockEvent;

    move-result-object v0

    return-object v0
.end method

.method public zzav(Landroid/os/Parcel;)Lcom/google/android/gms/common/stats/WakeLockEvent;
    .registers 21

    invoke-static/range {p1 .. p1}, Lcom/google/android/gms/common/internal/safeparcel/zza;->zzaj(Landroid/os/Parcel;)I

    move-result v2

    const/4 v3, 0x0

    const-wide/16 v4, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const-wide/16 v11, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    :goto_13
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v17

    move/from16 v0, v17

    if-ge v0, v2, :cond_9b

    invoke-static/range {p1 .. p1}, Lcom/google/android/gms/common/internal/safeparcel/zza;->zzai(Landroid/os/Parcel;)I

    move-result v17

    invoke-static/range {v17 .. v17}, Lcom/google/android/gms/common/internal/safeparcel/zza;->zzbH(I)I

    move-result v18

    packed-switch v18, :pswitch_data_c4

    :pswitch_26
    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/safeparcel/zza;->zzb(Landroid/os/Parcel;I)V

    goto :goto_13

    :pswitch_2e
    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/safeparcel/zza;->zzg(Landroid/os/Parcel;I)I

    move-result v3

    goto :goto_13

    :pswitch_37
    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/safeparcel/zza;->zzi(Landroid/os/Parcel;I)J

    move-result-wide v4

    goto :goto_13

    :pswitch_40
    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/safeparcel/zza;->zzo(Landroid/os/Parcel;I)Ljava/lang/String;

    move-result-object v7

    goto :goto_13

    :pswitch_49
    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/safeparcel/zza;->zzg(Landroid/os/Parcel;I)I

    move-result v8

    goto :goto_13

    :pswitch_52
    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/safeparcel/zza;->zzC(Landroid/os/Parcel;I)Ljava/util/ArrayList;

    move-result-object v9

    goto :goto_13

    :pswitch_5b
    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/safeparcel/zza;->zzi(Landroid/os/Parcel;I)J

    move-result-wide v11

    goto :goto_13

    :pswitch_64
    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/safeparcel/zza;->zzo(Landroid/os/Parcel;I)Ljava/lang/String;

    move-result-object v14

    goto :goto_13

    :pswitch_6d
    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/safeparcel/zza;->zzg(Landroid/os/Parcel;I)I

    move-result v6

    goto :goto_13

    :pswitch_76
    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/safeparcel/zza;->zzo(Landroid/os/Parcel;I)Ljava/lang/String;

    move-result-object v10

    goto :goto_13

    :pswitch_7f
    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/safeparcel/zza;->zzo(Landroid/os/Parcel;I)Ljava/lang/String;

    move-result-object v15

    goto :goto_13

    :pswitch_88
    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/safeparcel/zza;->zzg(Landroid/os/Parcel;I)I

    move-result v13

    goto :goto_13

    :pswitch_91
    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/safeparcel/zza;->zzl(Landroid/os/Parcel;I)F

    move-result v16

    goto/16 :goto_13

    :cond_9b
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v17

    move/from16 v0, v17

    if-eq v0, v2, :cond_be

    new-instance v3, Lcom/google/android/gms/common/internal/safeparcel/zza$zza;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Overread allowed size end="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-direct {v3, v2, v0}, Lcom/google/android/gms/common/internal/safeparcel/zza$zza;-><init>(Ljava/lang/String;Landroid/os/Parcel;)V

    throw v3

    :cond_be
    new-instance v2, Lcom/google/android/gms/common/stats/WakeLockEvent;

    invoke-direct/range {v2 .. v16}, Lcom/google/android/gms/common/stats/WakeLockEvent;-><init>(IJILjava/lang/String;ILjava/util/List;Ljava/lang/String;JILjava/lang/String;Ljava/lang/String;F)V

    return-object v2

    :pswitch_data_c4
    .packed-switch 0x1
        :pswitch_2e
        :pswitch_37
        :pswitch_26
        :pswitch_40
        :pswitch_49
        :pswitch_52
        :pswitch_26
        :pswitch_5b
        :pswitch_26
        :pswitch_64
        :pswitch_6d
        :pswitch_76
        :pswitch_7f
        :pswitch_88
        :pswitch_91
    .end packed-switch
.end method

.method public zzbU(I)[Lcom/google/android/gms/common/stats/WakeLockEvent;
    .registers 3

    new-array v0, p1, [Lcom/google/android/gms/common/stats/WakeLockEvent;

    return-object v0
.end method
