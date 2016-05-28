.class public Lcom/google/android/gms/internal/zzrs;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<M:",
        "Lcom/google/android/gms/internal/zzrr",
        "<TM;>;T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public final tag:I

.field protected final type:I

.field protected final zzbcb:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<TT;>;"
        }
    .end annotation
.end field

.field protected final zzbcc:Z


# virtual methods
.method zzS(Ljava/lang/Object;)I
    .registers 3

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzrs;->zzbcc:Z

    if-eqz v0, :cond_9

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzrs;->zzT(Ljava/lang/Object;)I

    move-result v0

    :goto_8
    return v0

    :cond_9
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzrs;->zzU(Ljava/lang/Object;)I

    move-result v0

    goto :goto_8
.end method

.method protected zzT(Ljava/lang/Object;)I
    .registers 6

    const/4 v0, 0x0

    invoke-static {p1}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v2

    move v1, v0

    :goto_6
    if-ge v1, v2, :cond_1a

    invoke-static {p1, v1}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_17

    invoke-static {p1, v1}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/google/android/gms/internal/zzrs;->zzU(Ljava/lang/Object;)I

    move-result v3

    add-int/2addr v0, v3

    :cond_17
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    :cond_1a
    return v0
.end method

.method protected zzU(Ljava/lang/Object;)I
    .registers 5

    iget v0, p0, Lcom/google/android/gms/internal/zzrs;->tag:I

    invoke-static {v0}, Lcom/google/android/gms/internal/zzsa;->zzlE(I)I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/zzrs;->type:I

    packed-switch v1, :pswitch_data_34

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/google/android/gms/internal/zzrs;->type:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_26
    check-cast p1, Lcom/google/android/gms/internal/zzrx;

    invoke-static {v0, p1}, Lcom/google/android/gms/internal/zzrq;->zzb(ILcom/google/android/gms/internal/zzrx;)I

    move-result v0

    :goto_2c
    return v0

    :pswitch_2d
    check-cast p1, Lcom/google/android/gms/internal/zzrx;

    invoke-static {v0, p1}, Lcom/google/android/gms/internal/zzrq;->zzc(ILcom/google/android/gms/internal/zzrx;)I

    move-result v0

    goto :goto_2c

    :pswitch_data_34
    .packed-switch 0xa
        :pswitch_26
        :pswitch_2d
    .end packed-switch
.end method

.method zza(Ljava/lang/Object;Lcom/google/android/gms/internal/zzrq;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzrs;->zzbcc:Z

    if-eqz v0, :cond_8

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/zzrs;->zzc(Ljava/lang/Object;Lcom/google/android/gms/internal/zzrq;)V

    :goto_7
    return-void

    :cond_8
    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/zzrs;->zzb(Ljava/lang/Object;Lcom/google/android/gms/internal/zzrq;)V

    goto :goto_7
.end method

.method protected zzb(Ljava/lang/Object;Lcom/google/android/gms/internal/zzrq;)V
    .registers 6

    :try_start_0
    iget v0, p0, Lcom/google/android/gms/internal/zzrs;->tag:I

    invoke-virtual {p2, v0}, Lcom/google/android/gms/internal/zzrq;->zzlw(I)V

    iget v0, p0, Lcom/google/android/gms/internal/zzrs;->type:I

    packed-switch v0, :pswitch_data_42

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/google/android/gms/internal/zzrs;->type:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_25
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_25} :catch_25

    :catch_25
    move-exception v0

    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    :pswitch_2c
    :try_start_2c
    check-cast p1, Lcom/google/android/gms/internal/zzrx;

    iget v0, p0, Lcom/google/android/gms/internal/zzrs;->tag:I

    invoke-static {v0}, Lcom/google/android/gms/internal/zzsa;->zzlE(I)I

    move-result v0

    invoke-virtual {p2, p1}, Lcom/google/android/gms/internal/zzrq;->zzb(Lcom/google/android/gms/internal/zzrx;)V

    const/4 v1, 0x4

    invoke-virtual {p2, v0, v1}, Lcom/google/android/gms/internal/zzrq;->zzD(II)V

    :goto_3b
    return-void

    :pswitch_3c
    check-cast p1, Lcom/google/android/gms/internal/zzrx;

    invoke-virtual {p2, p1}, Lcom/google/android/gms/internal/zzrq;->zzc(Lcom/google/android/gms/internal/zzrx;)V
    :try_end_41
    .catch Ljava/io/IOException; {:try_start_2c .. :try_end_41} :catch_25

    goto :goto_3b

    :pswitch_data_42
    .packed-switch 0xa
        :pswitch_2c
        :pswitch_3c
    .end packed-switch
.end method

.method protected zzc(Ljava/lang/Object;Lcom/google/android/gms/internal/zzrq;)V
    .registers 6

    invoke-static {p1}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v1

    const/4 v0, 0x0

    :goto_5
    if-ge v0, v1, :cond_13

    invoke-static {p1, v0}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_10

    invoke-virtual {p0, v2, p2}, Lcom/google/android/gms/internal/zzrs;->zzb(Ljava/lang/Object;Lcom/google/android/gms/internal/zzrq;)V

    :cond_10
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_13
    return-void
.end method
