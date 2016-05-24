.class public final Lcom/google/android/gms/internal/zzrq;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzrq$zza;
    }
.end annotation


# instance fields
.field private final zzbbZ:Ljava/nio/ByteBuffer;


# direct methods
.method private constructor <init>(Ljava/nio/ByteBuffer;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzrq;->zzbbZ:Ljava/nio/ByteBuffer;

    return-void
.end method

.method private constructor <init>([BII)V
    .registers 5

    invoke-static {p1, p2, p3}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzrq;-><init>(Ljava/nio/ByteBuffer;)V

    return-void
.end method

.method public static zzA([B)Lcom/google/android/gms/internal/zzrq;
    .registers 3

    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1}, Lcom/google/android/gms/internal/zzrq;->zzb([BII)Lcom/google/android/gms/internal/zzrq;

    move-result-object v0

    return-object v0
.end method

.method public static zzB(II)I
    .registers 4

    invoke-static {p0}, Lcom/google/android/gms/internal/zzrq;->zzlv(I)I

    move-result v0

    invoke-static {p1}, Lcom/google/android/gms/internal/zzrq;->zzls(I)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public static zzY(J)I
    .registers 4

    invoke-static {p0, p1}, Lcom/google/android/gms/internal/zzrq;->zzab(J)I

    move-result v0

    return v0
.end method

.method private static zza(Ljava/lang/CharSequence;I)I
    .registers 7

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    const/4 v1, 0x0

    move v0, p1

    :goto_6
    if-ge v0, v2, :cond_48

    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    const/16 v4, 0x800

    if-ge v3, v4, :cond_18

    rsub-int/lit8 v3, v3, 0x7f

    ushr-int/lit8 v3, v3, 0x1f

    add-int/2addr v1, v3

    :cond_15
    :goto_15
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_18
    add-int/lit8 v1, v1, 0x2

    const v4, 0xd800

    if-gt v4, v3, :cond_15

    const v4, 0xdfff

    if-gt v3, v4, :cond_15

    invoke-static {p0, v0}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    move-result v3

    const/high16 v4, 0x10000

    if-ge v3, v4, :cond_45

    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unpaired surrogate at index "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_45
    add-int/lit8 v0, v0, 0x1

    goto :goto_15

    :cond_48
    return v1
.end method

.method private static zza(Ljava/lang/CharSequence;[BII)I
    .registers 12

    const/16 v7, 0x80

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v3

    const/4 v0, 0x0

    add-int v4, p2, p3

    :goto_9
    if-ge v0, v3, :cond_1d

    add-int v1, v0, p2

    if-ge v1, v4, :cond_1d

    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    if-ge v1, v7, :cond_1d

    add-int v2, p2, v0

    int-to-byte v1, v1

    aput-byte v1, p1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    :cond_1d
    if-ne v0, v3, :cond_22

    add-int v0, p2, v3

    :goto_21
    return v0

    :cond_22
    add-int v2, p2, v0

    :goto_24
    if-ge v0, v3, :cond_102

    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v5

    if-ge v5, v7, :cond_37

    if-ge v2, v4, :cond_37

    add-int/lit8 v1, v2, 0x1

    int-to-byte v5, v5

    aput-byte v5, p1, v2

    :goto_33
    add-int/lit8 v0, v0, 0x1

    move v2, v1

    goto :goto_24

    :cond_37
    const/16 v1, 0x800

    if-ge v5, v1, :cond_52

    add-int/lit8 v1, v4, -0x2

    if-gt v2, v1, :cond_52

    add-int/lit8 v6, v2, 0x1

    ushr-int/lit8 v1, v5, 0x6

    or-int/lit16 v1, v1, 0x3c0

    int-to-byte v1, v1

    aput-byte v1, p1, v2

    add-int/lit8 v1, v6, 0x1

    and-int/lit8 v2, v5, 0x3f

    or-int/lit16 v2, v2, 0x80

    int-to-byte v2, v2

    aput-byte v2, p1, v6

    goto :goto_33

    :cond_52
    const v1, 0xd800

    if-lt v5, v1, :cond_5c

    const v1, 0xdfff

    if-ge v1, v5, :cond_7e

    :cond_5c
    add-int/lit8 v1, v4, -0x3

    if-gt v2, v1, :cond_7e

    add-int/lit8 v1, v2, 0x1

    ushr-int/lit8 v6, v5, 0xc

    or-int/lit16 v6, v6, 0x1e0

    int-to-byte v6, v6

    aput-byte v6, p1, v2

    add-int/lit8 v2, v1, 0x1

    ushr-int/lit8 v6, v5, 0x6

    and-int/lit8 v6, v6, 0x3f

    or-int/lit16 v6, v6, 0x80

    int-to-byte v6, v6

    aput-byte v6, p1, v1

    add-int/lit8 v1, v2, 0x1

    and-int/lit8 v5, v5, 0x3f

    or-int/lit16 v5, v5, 0x80

    int-to-byte v5, v5

    aput-byte v5, p1, v2

    goto :goto_33

    :cond_7e
    add-int/lit8 v1, v4, -0x4

    if-gt v2, v1, :cond_df

    add-int/lit8 v1, v0, 0x1

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v6

    if-eq v1, v6, :cond_96

    add-int/lit8 v0, v0, 0x1

    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    invoke-static {v5, v1}, Ljava/lang/Character;->isSurrogatePair(CC)Z

    move-result v6

    if-nez v6, :cond_b1

    :cond_96
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unpaired surrogate at index "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_b1
    invoke-static {v5, v1}, Ljava/lang/Character;->toCodePoint(CC)I

    move-result v5

    add-int/lit8 v1, v2, 0x1

    ushr-int/lit8 v6, v5, 0x12

    or-int/lit16 v6, v6, 0xf0

    int-to-byte v6, v6

    aput-byte v6, p1, v2

    add-int/lit8 v2, v1, 0x1

    ushr-int/lit8 v6, v5, 0xc

    and-int/lit8 v6, v6, 0x3f

    or-int/lit16 v6, v6, 0x80

    int-to-byte v6, v6

    aput-byte v6, p1, v1

    add-int/lit8 v6, v2, 0x1

    ushr-int/lit8 v1, v5, 0x6

    and-int/lit8 v1, v1, 0x3f

    or-int/lit16 v1, v1, 0x80

    int-to-byte v1, v1

    aput-byte v1, p1, v2

    add-int/lit8 v1, v6, 0x1

    and-int/lit8 v2, v5, 0x3f

    or-int/lit16 v2, v2, 0x80

    int-to-byte v2, v2

    aput-byte v2, p1, v6

    goto/16 :goto_33

    :cond_df
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed writing "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " at index "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_102
    move v0, v2

    goto/16 :goto_21
.end method

.method private static zza(Ljava/lang/CharSequence;Ljava/nio/ByteBuffer;)V
    .registers 5

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->isReadOnly()Z

    move-result v0

    if-eqz v0, :cond_c

    new-instance v0, Ljava/nio/ReadOnlyBufferException;

    invoke-direct {v0}, Ljava/nio/ReadOnlyBufferException;-><init>()V

    throw v0

    :cond_c
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->hasArray()Z

    move-result v0

    if-eqz v0, :cond_3a

    :try_start_12
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v1

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    add-int/2addr v1, v2

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    invoke-static {p0, v0, v1, v2}, Lcom/google/android/gms/internal/zzrq;->zza(Ljava/lang/CharSequence;[BII)I

    move-result v0

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;
    :try_end_2f
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_12 .. :try_end_2f} :catch_30

    :goto_2f
    return-void

    :catch_30
    move-exception v0

    new-instance v1, Ljava/nio/BufferOverflowException;

    invoke-direct {v1}, Ljava/nio/BufferOverflowException;-><init>()V

    invoke-virtual {v1, v0}, Ljava/nio/BufferOverflowException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    throw v1

    :cond_3a
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/zzrq;->zzb(Ljava/lang/CharSequence;Ljava/nio/ByteBuffer;)V

    goto :goto_2f
.end method

.method public static zzab(J)I
    .registers 6

    const-wide/16 v2, 0x0

    const-wide/16 v0, -0x80

    and-long/2addr v0, p0

    cmp-long v0, v0, v2

    if-nez v0, :cond_b

    const/4 v0, 0x1

    :goto_a
    return v0

    :cond_b
    const-wide/16 v0, -0x4000

    and-long/2addr v0, p0

    cmp-long v0, v0, v2

    if-nez v0, :cond_14

    const/4 v0, 0x2

    goto :goto_a

    :cond_14
    const-wide/32 v0, -0x200000

    and-long/2addr v0, p0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1e

    const/4 v0, 0x3

    goto :goto_a

    :cond_1e
    const-wide/32 v0, -0x10000000

    and-long/2addr v0, p0

    cmp-long v0, v0, v2

    if-nez v0, :cond_28

    const/4 v0, 0x4

    goto :goto_a

    :cond_28
    const-wide v0, -0x800000000L

    and-long/2addr v0, p0

    cmp-long v0, v0, v2

    if-nez v0, :cond_34

    const/4 v0, 0x5

    goto :goto_a

    :cond_34
    const-wide v0, -0x40000000000L

    and-long/2addr v0, p0

    cmp-long v0, v0, v2

    if-nez v0, :cond_40

    const/4 v0, 0x6

    goto :goto_a

    :cond_40
    const-wide/high16 v0, -0x2000000000000L

    and-long/2addr v0, p0

    cmp-long v0, v0, v2

    if-nez v0, :cond_49

    const/4 v0, 0x7

    goto :goto_a

    :cond_49
    const-wide/high16 v0, -0x100000000000000L

    and-long/2addr v0, p0

    cmp-long v0, v0, v2

    if-nez v0, :cond_53

    const/16 v0, 0x8

    goto :goto_a

    :cond_53
    const-wide/high16 v0, -0x8000000000000000L

    and-long/2addr v0, p0

    cmp-long v0, v0, v2

    if-nez v0, :cond_5d

    const/16 v0, 0x9

    goto :goto_a

    :cond_5d
    const/16 v0, 0xa

    goto :goto_a
.end method

.method public static zzax(Z)I
    .registers 2

    const/4 v0, 0x1

    return v0
.end method

.method public static zzb(ILcom/google/android/gms/internal/zzrx;)I
    .registers 4

    invoke-static {p0}, Lcom/google/android/gms/internal/zzrq;->zzlv(I)I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    invoke-static {p1}, Lcom/google/android/gms/internal/zzrq;->zzd(Lcom/google/android/gms/internal/zzrx;)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public static zzb([BII)Lcom/google/android/gms/internal/zzrq;
    .registers 4

    new-instance v0, Lcom/google/android/gms/internal/zzrq;

    invoke-direct {v0, p0, p1, p2}, Lcom/google/android/gms/internal/zzrq;-><init>([BII)V

    return-object v0
.end method

.method private static zzb(Ljava/lang/CharSequence;Ljava/nio/ByteBuffer;)V
    .registers 7

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    const/4 v0, 0x0

    :goto_5
    if-ge v0, v1, :cond_a9

    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    const/16 v3, 0x80

    if-ge v2, v3, :cond_16

    int-to-byte v2, v2

    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    :goto_13
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_16
    const/16 v3, 0x800

    if-ge v2, v3, :cond_2b

    ushr-int/lit8 v3, v2, 0x6

    or-int/lit16 v3, v3, 0x3c0

    int-to-byte v3, v3

    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    and-int/lit8 v2, v2, 0x3f

    or-int/lit16 v2, v2, 0x80

    int-to-byte v2, v2

    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    goto :goto_13

    :cond_2b
    const v3, 0xd800

    if-lt v2, v3, :cond_35

    const v3, 0xdfff

    if-ge v3, v2, :cond_50

    :cond_35
    ushr-int/lit8 v3, v2, 0xc

    or-int/lit16 v3, v3, 0x1e0

    int-to-byte v3, v3

    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    ushr-int/lit8 v3, v2, 0x6

    and-int/lit8 v3, v3, 0x3f

    or-int/lit16 v3, v3, 0x80

    int-to-byte v3, v3

    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    and-int/lit8 v2, v2, 0x3f

    or-int/lit16 v2, v2, 0x80

    int-to-byte v2, v2

    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    goto :goto_13

    :cond_50
    add-int/lit8 v3, v0, 0x1

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v4

    if-eq v3, v4, :cond_64

    add-int/lit8 v0, v0, 0x1

    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Character;->isSurrogatePair(CC)Z

    move-result v4

    if-nez v4, :cond_7f

    :cond_64
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unpaired surrogate at index "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_7f
    invoke-static {v2, v3}, Ljava/lang/Character;->toCodePoint(CC)I

    move-result v2

    ushr-int/lit8 v3, v2, 0x12

    or-int/lit16 v3, v3, 0xf0

    int-to-byte v3, v3

    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    ushr-int/lit8 v3, v2, 0xc

    and-int/lit8 v3, v3, 0x3f

    or-int/lit16 v3, v3, 0x80

    int-to-byte v3, v3

    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    ushr-int/lit8 v3, v2, 0x6

    and-int/lit8 v3, v3, 0x3f

    or-int/lit16 v3, v3, 0x80

    int-to-byte v3, v3

    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    and-int/lit8 v2, v2, 0x3f

    or-int/lit16 v2, v2, 0x80

    int-to-byte v2, v2

    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    goto/16 :goto_13

    :cond_a9
    return-void
.end method

.method public static zzc(IF)I
    .registers 4

    invoke-static {p0}, Lcom/google/android/gms/internal/zzrq;->zzlv(I)I

    move-result v0

    invoke-static {p1}, Lcom/google/android/gms/internal/zzrq;->zzj(F)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public static zzc(ILcom/google/android/gms/internal/zzrx;)I
    .registers 4

    invoke-static {p0}, Lcom/google/android/gms/internal/zzrq;->zzlv(I)I

    move-result v0

    invoke-static {p1}, Lcom/google/android/gms/internal/zzrq;->zze(Lcom/google/android/gms/internal/zzrx;)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public static zzc(IZ)I
    .registers 4

    invoke-static {p0}, Lcom/google/android/gms/internal/zzrq;->zzlv(I)I

    move-result v0

    invoke-static {p1}, Lcom/google/android/gms/internal/zzrq;->zzax(Z)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method private static zzc(Ljava/lang/CharSequence;)I
    .registers 9

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    const/4 v0, 0x0

    :goto_5
    if-ge v0, v2, :cond_4e

    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    const/16 v3, 0x80

    if-ge v1, v3, :cond_4e

    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :goto_12
    if-ge v1, v2, :cond_2b

    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    const/16 v4, 0x800

    if-ge v3, v4, :cond_26

    rsub-int/lit8 v3, v3, 0x7f

    ushr-int/lit8 v3, v3, 0x1f

    add-int/2addr v3, v0

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    move v0, v3

    goto :goto_12

    :cond_26
    invoke-static {p0, v1}, Lcom/google/android/gms/internal/zzrq;->zza(Ljava/lang/CharSequence;I)I

    move-result v1

    add-int/2addr v0, v1

    :cond_2b
    if-ge v0, v2, :cond_4d

    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "UTF-8 length does not fit in int: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    int-to-long v4, v0

    const-wide v6, 0x100000000L

    add-long/2addr v4, v6

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_4d
    return v0

    :cond_4e
    move v1, v0

    move v0, v2

    goto :goto_12
.end method

.method public static zzd(IJ)I
    .registers 6

    invoke-static {p0}, Lcom/google/android/gms/internal/zzrq;->zzlv(I)I

    move-result v0

    invoke-static {p1, p2}, Lcom/google/android/gms/internal/zzrq;->zzY(J)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public static zzd(Lcom/google/android/gms/internal/zzrx;)I
    .registers 2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzrx;->zzDx()I

    move-result v0

    return v0
.end method

.method public static zze(Lcom/google/android/gms/internal/zzrx;)I
    .registers 3

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzrx;->zzDx()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzrq;->zzlx(I)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public static zzfy(Ljava/lang/String;)I
    .registers 3

    invoke-static {p0}, Lcom/google/android/gms/internal/zzrq;->zzc(Ljava/lang/CharSequence;)I

    move-result v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzrq;->zzlx(I)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public static zzj(F)I
    .registers 2

    const/4 v0, 0x4

    return v0
.end method

.method public static zzl(ILjava/lang/String;)I
    .registers 4

    invoke-static {p0}, Lcom/google/android/gms/internal/zzrq;->zzlv(I)I

    move-result v0

    invoke-static {p1}, Lcom/google/android/gms/internal/zzrq;->zzfy(Ljava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public static zzls(I)I
    .registers 2

    if-ltz p0, :cond_7

    invoke-static {p0}, Lcom/google/android/gms/internal/zzrq;->zzlx(I)I

    move-result v0

    :goto_6
    return v0

    :cond_7
    const/16 v0, 0xa

    goto :goto_6
.end method

.method public static zzlv(I)I
    .registers 2

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/google/android/gms/internal/zzsa;->zzE(II)I

    move-result v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzrq;->zzlx(I)I

    move-result v0

    return v0
.end method

.method public static zzlx(I)I
    .registers 2

    and-int/lit8 v0, p0, -0x80

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    and-int/lit16 v0, p0, -0x4000

    if-nez v0, :cond_c

    const/4 v0, 0x2

    goto :goto_5

    :cond_c
    const/high16 v0, -0x200000

    and-int/2addr v0, p0

    if-nez v0, :cond_13

    const/4 v0, 0x3

    goto :goto_5

    :cond_13
    const/high16 v0, -0x10000000

    and-int/2addr v0, p0

    if-nez v0, :cond_1a

    const/4 v0, 0x4

    goto :goto_5

    :cond_1a
    const/4 v0, 0x5

    goto :goto_5
.end method


# virtual methods
.method public zzD(II)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-static {p1, p2}, Lcom/google/android/gms/internal/zzsa;->zzE(II)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzrq;->zzlw(I)V

    return-void
.end method

.method public zzD([B)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/google/android/gms/internal/zzrq;->zzc([BII)V

    return-void
.end method

.method public zzDi()I
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzrq;->zzbbZ:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    return v0
.end method

.method public zzW(J)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/zzrq;->zzaa(J)V

    return-void
.end method

.method public zza(ILcom/google/android/gms/internal/zzrx;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x2

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/zzrq;->zzD(II)V

    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/zzrq;->zzc(Lcom/google/android/gms/internal/zzrx;)V

    return-void
.end method

.method public zzaa(J)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :goto_0
    const-wide/16 v0, -0x80

    and-long/2addr v0, p1

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_e

    long-to-int v0, p1

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzrq;->zzlu(I)V

    return-void

    :cond_e
    long-to-int v0, p1

    and-int/lit8 v0, v0, 0x7f

    or-int/lit16 v0, v0, 0x80

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzrq;->zzlu(I)V

    const/4 v0, 0x7

    ushr-long/2addr p1, v0

    goto :goto_0
.end method

.method public zzaw(Z)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p1, :cond_7

    const/4 v0, 0x1

    :goto_3
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzrq;->zzlu(I)V

    return-void

    :cond_7
    const/4 v0, 0x0

    goto :goto_3
.end method

.method public zzb(B)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzrq;->zzbbZ:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    if-nez v0, :cond_1a

    new-instance v0, Lcom/google/android/gms/internal/zzrq$zza;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzrq;->zzbbZ:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzrq;->zzbbZ:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->limit()I

    move-result v2

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/zzrq$zza;-><init>(II)V

    throw v0

    :cond_1a
    iget-object v0, p0, Lcom/google/android/gms/internal/zzrq;->zzbbZ:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    return-void
.end method

.method public zzb(IF)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x5

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/zzrq;->zzD(II)V

    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/zzrq;->zzi(F)V

    return-void
.end method

.method public zzb(IJ)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/zzrq;->zzD(II)V

    invoke-virtual {p0, p2, p3}, Lcom/google/android/gms/internal/zzrq;->zzW(J)V

    return-void
.end method

.method public zzb(ILjava/lang/String;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x2

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/zzrq;->zzD(II)V

    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/zzrq;->zzfx(Ljava/lang/String;)V

    return-void
.end method

.method public zzb(IZ)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/zzrq;->zzD(II)V

    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/zzrq;->zzaw(Z)V

    return-void
.end method

.method public zzb(Lcom/google/android/gms/internal/zzrx;)V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1, p0}, Lcom/google/android/gms/internal/zzrx;->zza(Lcom/google/android/gms/internal/zzrq;)V

    return-void
.end method

.method public zzc(Lcom/google/android/gms/internal/zzrx;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzrx;->zzDw()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzrq;->zzlw(I)V

    invoke-virtual {p1, p0}, Lcom/google/android/gms/internal/zzrx;->zza(Lcom/google/android/gms/internal/zzrq;)V

    return-void
.end method

.method public zzc([BII)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzrq;->zzbbZ:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    if-lt v0, p3, :cond_e

    iget-object v0, p0, Lcom/google/android/gms/internal/zzrq;->zzbbZ:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1, p2, p3}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    return-void

    :cond_e
    new-instance v0, Lcom/google/android/gms/internal/zzrq$zza;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzrq;->zzbbZ:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzrq;->zzbbZ:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->limit()I

    move-result v2

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/zzrq$zza;-><init>(II)V

    throw v0
.end method

.method public zzfx(Ljava/lang/String;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzrq;->zzlx(I)I

    move-result v0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    mul-int/lit8 v1, v1, 0x3

    invoke-static {v1}, Lcom/google/android/gms/internal/zzrq;->zzlx(I)I

    move-result v1

    if-ne v0, v1, :cond_3e

    iget-object v1, p0, Lcom/google/android/gms/internal/zzrq;->zzbbZ:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzrq;->zzbbZ:Ljava/nio/ByteBuffer;

    add-int v3, v1, v0

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzrq;->zzbbZ:Ljava/nio/ByteBuffer;

    invoke-static {p1, v2}, Lcom/google/android/gms/internal/zzrq;->zza(Ljava/lang/CharSequence;Ljava/nio/ByteBuffer;)V

    iget-object v2, p0, Lcom/google/android/gms/internal/zzrq;->zzbbZ:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    iget-object v3, p0, Lcom/google/android/gms/internal/zzrq;->zzbbZ:Ljava/nio/ByteBuffer;

    invoke-virtual {v3, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    sub-int v1, v2, v1

    sub-int v0, v1, v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzrq;->zzlw(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzrq;->zzbbZ:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    :goto_3d
    return-void

    :cond_3e
    invoke-static {p1}, Lcom/google/android/gms/internal/zzrq;->zzc(Ljava/lang/CharSequence;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzrq;->zzlw(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzrq;->zzbbZ:Ljava/nio/ByteBuffer;

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzrq;->zza(Ljava/lang/CharSequence;Ljava/nio/ByteBuffer;)V
    :try_end_4a
    .catch Ljava/nio/BufferOverflowException; {:try_start_0 .. :try_end_4a} :catch_4b

    goto :goto_3d

    :catch_4b
    move-exception v0

    new-instance v0, Lcom/google/android/gms/internal/zzrq$zza;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzrq;->zzbbZ:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzrq;->zzbbZ:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->limit()I

    move-result v2

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/zzrq$zza;-><init>(II)V

    throw v0
.end method

.method public zzi(F)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-static {p1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzrq;->zzly(I)V

    return-void
.end method

.method public zzlq(I)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-ltz p1, :cond_6

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzrq;->zzlw(I)V

    :goto_5
    return-void

    :cond_6
    int-to-long v0, p1

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzrq;->zzaa(J)V

    goto :goto_5
.end method

.method public zzlu(I)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    int-to-byte v0, p1

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzrq;->zzb(B)V

    return-void
.end method

.method public zzlw(I)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :goto_0
    and-int/lit8 v0, p1, -0x80

    if-nez v0, :cond_8

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzrq;->zzlu(I)V

    return-void

    :cond_8
    and-int/lit8 v0, p1, 0x7f

    or-int/lit16 v0, v0, 0x80

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzrq;->zzlu(I)V

    ushr-int/lit8 p1, p1, 0x7

    goto :goto_0
.end method

.method public zzly(I)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    and-int/lit16 v0, p1, 0xff

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzrq;->zzlu(I)V

    shr-int/lit8 v0, p1, 0x8

    and-int/lit16 v0, v0, 0xff

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzrq;->zzlu(I)V

    shr-int/lit8 v0, p1, 0x10

    and-int/lit16 v0, v0, 0xff

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzrq;->zzlu(I)V

    shr-int/lit8 v0, p1, 0x18

    and-int/lit16 v0, v0, 0xff

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzrq;->zzlu(I)V

    return-void
.end method

.method public zzz(II)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/zzrq;->zzD(II)V

    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/zzrq;->zzlq(I)V

    return-void
.end method
