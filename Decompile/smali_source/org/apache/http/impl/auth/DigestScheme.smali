.class public Lorg/apache/http/impl/auth/DigestScheme;
.super Lorg/apache/http/impl/auth/RFC2617Scheme;
.source "DigestScheme.java"


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# static fields
.field private static final HEXADECIMAL:[C

.field private static final QOP_AUTH:I = 0x2

.field private static final QOP_AUTH_INT:I = 0x1

.field private static final QOP_MISSING:I = 0x0

.field private static final QOP_UNKNOWN:I = -0x1


# instance fields
.field private a1:Ljava/lang/String;

.field private a2:Ljava/lang/String;

.field private cnonce:Ljava/lang/String;

.field private complete:Z

.field private lastNonce:Ljava/lang/String;

.field private nounceCount:J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 83
    const/16 v0, 0x10

    new-array v0, v0, [C

    fill-array-data v0, :array_a

    sput-object v0, Lorg/apache/http/impl/auth/DigestScheme;->HEXADECIMAL:[C

    return-void

    :array_a
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
    .end array-data
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 124
    sget-object v0, Lorg/apache/http/Consts;->ASCII:Ljava/nio/charset/Charset;

    invoke-direct {p0, v0}, Lorg/apache/http/impl/auth/DigestScheme;-><init>(Ljava/nio/charset/Charset;)V

    .line 125
    return-void
.end method

.method public constructor <init>(Ljava/nio/charset/Charset;)V
    .registers 3
    .param p1, "credentialsCharset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 106
    invoke-direct {p0, p1}, Lorg/apache/http/impl/auth/RFC2617Scheme;-><init>(Ljava/nio/charset/Charset;)V

    .line 107
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/http/impl/auth/DigestScheme;->complete:Z

    .line 108
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/auth/ChallengeState;)V
    .registers 2
    .param p1, "challengeState"    # Lorg/apache/http/auth/ChallengeState;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 120
    invoke-direct {p0, p1}, Lorg/apache/http/impl/auth/RFC2617Scheme;-><init>(Lorg/apache/http/auth/ChallengeState;)V

    .line 121
    return-void
.end method

.method public static createCnonce()Ljava/lang/String;
    .registers 3

    .prologue
    .line 473
    new-instance v0, Ljava/security/SecureRandom;

    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    .line 474
    .local v0, "rnd":Ljava/security/SecureRandom;
    const/16 v2, 0x8

    new-array v1, v2, [B

    .line 475
    .local v1, "tmp":[B
    invoke-virtual {v0, v1}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 476
    invoke-static {v1}, Lorg/apache/http/impl/auth/DigestScheme;->encode([B)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private createDigestHeader(Lorg/apache/http/auth/Credentials;Lorg/apache/http/HttpRequest;)Lorg/apache/http/Header;
    .registers 45
    .param p1, "credentials"    # Lorg/apache/http/auth/Credentials;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/auth/AuthenticationException;
        }
    .end annotation

    .prologue
    .line 248
    const-string v37, "uri"

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/auth/DigestScheme;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v35

    .line 249
    .local v35, "uri":Ljava/lang/String;
    const-string v37, "realm"

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/auth/DigestScheme;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v31

    .line 250
    .local v31, "realm":Ljava/lang/String;
    const-string v37, "nonce"

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/auth/DigestScheme;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    .line 251
    .local v23, "nonce":Ljava/lang/String;
    const-string v37, "opaque"

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/auth/DigestScheme;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    .line 252
    .local v24, "opaque":Ljava/lang/String;
    const-string v37, "methodname"

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/auth/DigestScheme;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 253
    .local v19, "method":Ljava/lang/String;
    const-string v37, "algorithm"

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/auth/DigestScheme;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 255
    .local v4, "algorithm":Ljava/lang/String;
    if-nez v4, :cond_40

    .line 256
    const-string v4, "MD5"

    .line 259
    :cond_40
    new-instance v30, Ljava/util/HashSet;

    const/16 v37, 0x8

    move-object/from16 v0, v30

    move/from16 v1, v37

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    .line 260
    .local v30, "qopset":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const/16 v28, -0x1

    .line 261
    .local v28, "qop":I
    const-string v37, "qop"

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/auth/DigestScheme;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v29

    .line 262
    .local v29, "qoplist":Ljava/lang/String;
    if-eqz v29, :cond_cc

    .line 263
    new-instance v33, Ljava/util/StringTokenizer;

    const-string v37, ","

    move-object/from16 v0, v33

    move-object/from16 v1, v29

    move-object/from16 v2, v37

    invoke-direct {v0, v1, v2}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 264
    .local v33, "tok":Ljava/util/StringTokenizer;
    :goto_66
    invoke-virtual/range {v33 .. v33}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v37

    if-eqz v37, :cond_82

    .line 265
    invoke-virtual/range {v33 .. v33}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v36

    .line 266
    .local v36, "variant":Ljava/lang/String;
    sget-object v37, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual/range {v36 .. v37}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v37

    move-object/from16 v0, v30

    move-object/from16 v1, v37

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_66

    .line 268
    .end local v36    # "variant":Ljava/lang/String;
    :cond_82
    move-object/from16 v0, p2

    instance-of v0, v0, Lorg/apache/http/HttpEntityEnclosingRequest;

    move/from16 v37, v0

    if-eqz v37, :cond_bd

    const-string v37, "auth-int"

    move-object/from16 v0, v30

    move-object/from16 v1, v37

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v37

    if-eqz v37, :cond_bd

    .line 269
    const/16 v28, 0x1

    .line 277
    .end local v33    # "tok":Ljava/util/StringTokenizer;
    :cond_98
    :goto_98
    const/16 v37, -0x1

    move/from16 v0, v28

    move/from16 v1, v37

    if-ne v0, v1, :cond_cf

    .line 278
    new-instance v37, Lorg/apache/http/auth/AuthenticationException;

    new-instance v38, Ljava/lang/StringBuilder;

    invoke-direct/range {v38 .. v38}, Ljava/lang/StringBuilder;-><init>()V

    const-string v39, "None of the qop methods is supported: "

    invoke-virtual/range {v38 .. v39}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v38

    move-object/from16 v0, v38

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v38

    invoke-virtual/range {v38 .. v38}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v38

    invoke-direct/range {v37 .. v38}, Lorg/apache/http/auth/AuthenticationException;-><init>(Ljava/lang/String;)V

    throw v37

    .line 270
    .restart local v33    # "tok":Ljava/util/StringTokenizer;
    :cond_bd
    const-string v37, "auth"

    move-object/from16 v0, v30

    move-object/from16 v1, v37

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v37

    if-eqz v37, :cond_98

    .line 271
    const/16 v28, 0x2

    goto :goto_98

    .line 274
    .end local v33    # "tok":Ljava/util/StringTokenizer;
    :cond_cc
    const/16 v28, 0x0

    goto :goto_98

    .line 281
    :cond_cf
    const-string v37, "charset"

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/auth/DigestScheme;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 282
    .local v6, "charset":Ljava/lang/String;
    if-nez v6, :cond_dd

    .line 283
    const-string v6, "ISO-8859-1"

    .line 286
    :cond_dd
    move-object v8, v4

    .line 287
    .local v8, "digAlg":Ljava/lang/String;
    const-string v37, "MD5-sess"

    move-object/from16 v0, v37

    invoke-virtual {v8, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v37

    if-eqz v37, :cond_ea

    .line 288
    const-string v8, "MD5"

    .line 293
    :cond_ea
    :try_start_ea
    invoke-static {v8}, Lorg/apache/http/impl/auth/DigestScheme;->createMessageDigest(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_ed
    .catch Lorg/apache/http/impl/auth/UnsupportedDigestAlgorithmException; {:try_start_ea .. :try_end_ed} :catch_3e6

    move-result-object v11

    .line 298
    .local v11, "digester":Ljava/security/MessageDigest;
    invoke-interface/range {p1 .. p1}, Lorg/apache/http/auth/Credentials;->getUserPrincipal()Ljava/security/Principal;

    move-result-object v37

    invoke-interface/range {v37 .. v37}, Ljava/security/Principal;->getName()Ljava/lang/String;

    move-result-object v34

    .line 299
    .local v34, "uname":Ljava/lang/String;
    invoke-interface/range {p1 .. p1}, Lorg/apache/http/auth/Credentials;->getPassword()Ljava/lang/String;

    move-result-object v27

    .line 301
    .local v27, "pwd":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/auth/DigestScheme;->lastNonce:Ljava/lang/String;

    move-object/from16 v37, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v37

    if-eqz v37, :cond_402

    .line 302
    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/apache/http/impl/auth/DigestScheme;->nounceCount:J

    move-wide/from16 v38, v0

    const-wide/16 v40, 0x1

    add-long v38, v38, v40

    move-wide/from16 v0, v38

    move-object/from16 v2, p0

    iput-wide v0, v2, Lorg/apache/http/impl/auth/DigestScheme;->nounceCount:J

    .line 308
    :goto_11a
    new-instance v32, Ljava/lang/StringBuilder;

    const/16 v37, 0x100

    move-object/from16 v0, v32

    move/from16 v1, v37

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 309
    .local v32, "sb":Ljava/lang/StringBuilder;
    new-instance v15, Ljava/util/Formatter;

    sget-object v37, Ljava/util/Locale;->US:Ljava/util/Locale;

    move-object/from16 v0, v32

    move-object/from16 v1, v37

    invoke-direct {v15, v0, v1}, Ljava/util/Formatter;-><init>(Ljava/lang/Appendable;Ljava/util/Locale;)V

    .line 310
    .local v15, "formatter":Ljava/util/Formatter;
    const-string v37, "%08x"

    const/16 v38, 0x1

    move/from16 v0, v38

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v38, v0

    const/16 v39, 0x0

    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/apache/http/impl/auth/DigestScheme;->nounceCount:J

    move-wide/from16 v40, v0

    invoke-static/range {v40 .. v41}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v40

    aput-object v40, v38, v39

    move-object/from16 v0, v37

    move-object/from16 v1, v38

    invoke-virtual {v15, v0, v1}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 311
    invoke-virtual {v15}, Ljava/util/Formatter;->close()V

    .line 312
    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 314
    .local v21, "nc":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/auth/DigestScheme;->cnonce:Ljava/lang/String;

    move-object/from16 v37, v0

    if-nez v37, :cond_168

    .line 315
    invoke-static {}, Lorg/apache/http/impl/auth/DigestScheme;->createCnonce()Ljava/lang/String;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/http/impl/auth/DigestScheme;->cnonce:Ljava/lang/String;

    .line 318
    :cond_168
    const/16 v37, 0x0

    move-object/from16 v0, v37

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/http/impl/auth/DigestScheme;->a1:Ljava/lang/String;

    .line 319
    const/16 v37, 0x0

    move-object/from16 v0, v37

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/http/impl/auth/DigestScheme;->a2:Ljava/lang/String;

    .line 321
    const-string v37, "MD5-sess"

    move-object/from16 v0, v37

    invoke-virtual {v4, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v37

    if-eqz v37, :cond_41a

    .line 327
    const/16 v37, 0x0

    move-object/from16 v0, v32

    move/from16 v1, v37

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 328
    move-object/from16 v0, v32

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const/16 v38, 0x3a

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const/16 v38, 0x3a

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 329
    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    move-object/from16 v0, v37

    invoke-static {v0, v6}, Lorg/apache/http/util/EncodingUtils;->getBytes(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v37

    move-object/from16 v0, v37

    invoke-virtual {v11, v0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v37

    invoke-static/range {v37 .. v37}, Lorg/apache/http/impl/auth/DigestScheme;->encode([B)Ljava/lang/String;

    move-result-object v7

    .line 330
    .local v7, "checksum":Ljava/lang/String;
    const/16 v37, 0x0

    move-object/from16 v0, v32

    move/from16 v1, v37

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 331
    move-object/from16 v0, v32

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const/16 v38, 0x3a

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const/16 v38, 0x3a

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/auth/DigestScheme;->cnonce:Ljava/lang/String;

    move-object/from16 v38, v0

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 332
    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/http/impl/auth/DigestScheme;->a1:Ljava/lang/String;

    .line 340
    .end local v7    # "checksum":Ljava/lang/String;
    :goto_1f8
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/auth/DigestScheme;->a1:Ljava/lang/String;

    move-object/from16 v37, v0

    move-object/from16 v0, v37

    invoke-static {v0, v6}, Lorg/apache/http/util/EncodingUtils;->getBytes(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v37

    move-object/from16 v0, v37

    invoke-virtual {v11, v0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v37

    invoke-static/range {v37 .. v37}, Lorg/apache/http/impl/auth/DigestScheme;->encode([B)Ljava/lang/String;

    move-result-object v16

    .line 342
    .local v16, "hasha1":Ljava/lang/String;
    const/16 v37, 0x2

    move/from16 v0, v28

    move/from16 v1, v37

    if-ne v0, v1, :cond_452

    .line 344
    new-instance v37, Ljava/lang/StringBuilder;

    invoke-direct/range {v37 .. v37}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v37

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const/16 v38, 0x3a

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/http/impl/auth/DigestScheme;->a2:Ljava/lang/String;

    .line 376
    .end local p2    # "request":Lorg/apache/http/HttpRequest;
    :goto_23b
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/auth/DigestScheme;->a2:Ljava/lang/String;

    move-object/from16 v37, v0

    move-object/from16 v0, v37

    invoke-static {v0, v6}, Lorg/apache/http/util/EncodingUtils;->getBytes(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v37

    move-object/from16 v0, v37

    invoke-virtual {v11, v0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v37

    invoke-static/range {v37 .. v37}, Lorg/apache/http/impl/auth/DigestScheme;->encode([B)Ljava/lang/String;

    move-result-object v17

    .line 381
    .local v17, "hasha2":Ljava/lang/String;
    if-nez v28, :cond_528

    .line 382
    const/16 v37, 0x0

    move-object/from16 v0, v32

    move/from16 v1, v37

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 383
    move-object/from16 v0, v32

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const/16 v38, 0x3a

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const/16 v38, 0x3a

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 384
    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 393
    .local v10, "digestValue":Ljava/lang/String;
    :goto_283
    invoke-static {v10}, Lorg/apache/http/util/EncodingUtils;->getAsciiBytes(Ljava/lang/String;)[B

    move-result-object v37

    move-object/from16 v0, v37

    invoke-virtual {v11, v0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v37

    invoke-static/range {v37 .. v37}, Lorg/apache/http/impl/auth/DigestScheme;->encode([B)Ljava/lang/String;

    move-result-object v9

    .line 395
    .local v9, "digest":Ljava/lang/String;
    new-instance v5, Lorg/apache/http/util/CharArrayBuffer;

    const/16 v37, 0x80

    move/from16 v0, v37

    invoke-direct {v5, v0}, Lorg/apache/http/util/CharArrayBuffer;-><init>(I)V

    .line 396
    .local v5, "buffer":Lorg/apache/http/util/CharArrayBuffer;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/http/impl/auth/DigestScheme;->isProxy()Z

    move-result v37

    if-eqz v37, :cond_593

    .line 397
    const-string v37, "Proxy-Authorization"

    move-object/from16 v0, v37

    invoke-virtual {v5, v0}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 401
    :goto_2a7
    const-string v37, ": Digest "

    move-object/from16 v0, v37

    invoke-virtual {v5, v0}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 403
    new-instance v26, Ljava/util/ArrayList;

    const/16 v37, 0x14

    move-object/from16 v0, v26

    move/from16 v1, v37

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 404
    .local v26, "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/message/BasicNameValuePair;>;"
    new-instance v37, Lorg/apache/http/message/BasicNameValuePair;

    const-string v38, "username"

    move-object/from16 v0, v37

    move-object/from16 v1, v38

    move-object/from16 v2, v34

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v26

    move-object/from16 v1, v37

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 405
    new-instance v37, Lorg/apache/http/message/BasicNameValuePair;

    const-string v38, "realm"

    move-object/from16 v0, v37

    move-object/from16 v1, v38

    move-object/from16 v2, v31

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v26

    move-object/from16 v1, v37

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 406
    new-instance v37, Lorg/apache/http/message/BasicNameValuePair;

    const-string v38, "nonce"

    move-object/from16 v0, v37

    move-object/from16 v1, v38

    move-object/from16 v2, v23

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v26

    move-object/from16 v1, v37

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 407
    new-instance v37, Lorg/apache/http/message/BasicNameValuePair;

    const-string v38, "uri"

    move-object/from16 v0, v37

    move-object/from16 v1, v38

    move-object/from16 v2, v35

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v26

    move-object/from16 v1, v37

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 408
    new-instance v37, Lorg/apache/http/message/BasicNameValuePair;

    const-string v38, "response"

    move-object/from16 v0, v37

    move-object/from16 v1, v38

    invoke-direct {v0, v1, v9}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v26

    move-object/from16 v1, v37

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 410
    if-eqz v28, :cond_363

    .line 411
    new-instance v38, Lorg/apache/http/message/BasicNameValuePair;

    const-string v39, "qop"

    const/16 v37, 0x1

    move/from16 v0, v28

    move/from16 v1, v37

    if-ne v0, v1, :cond_59c

    const-string v37, "auth-int"

    :goto_32b
    move-object/from16 v0, v38

    move-object/from16 v1, v39

    move-object/from16 v2, v37

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v26

    move-object/from16 v1, v38

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 412
    new-instance v37, Lorg/apache/http/message/BasicNameValuePair;

    const-string v38, "nc"

    move-object/from16 v0, v37

    move-object/from16 v1, v38

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v26

    move-object/from16 v1, v37

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 413
    new-instance v37, Lorg/apache/http/message/BasicNameValuePair;

    const-string v38, "cnonce"

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/auth/DigestScheme;->cnonce:Ljava/lang/String;

    move-object/from16 v39, v0

    invoke-direct/range {v37 .. v39}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v26

    move-object/from16 v1, v37

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 416
    :cond_363
    new-instance v37, Lorg/apache/http/message/BasicNameValuePair;

    const-string v38, "algorithm"

    move-object/from16 v0, v37

    move-object/from16 v1, v38

    invoke-direct {v0, v1, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v26

    move-object/from16 v1, v37

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 417
    if-eqz v24, :cond_38b

    .line 418
    new-instance v37, Lorg/apache/http/message/BasicNameValuePair;

    const-string v38, "opaque"

    move-object/from16 v0, v37

    move-object/from16 v1, v38

    move-object/from16 v2, v24

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v26

    move-object/from16 v1, v37

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 421
    :cond_38b
    const/16 v18, 0x0

    .local v18, "i":I
    :goto_38d
    invoke-interface/range {v26 .. v26}, Ljava/util/List;->size()I

    move-result v37

    move/from16 v0, v18

    move/from16 v1, v37

    if-ge v0, v1, :cond_5a8

    .line 422
    move-object/from16 v0, v26

    move/from16 v1, v18

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Lorg/apache/http/message/BasicNameValuePair;

    .line 423
    .local v25, "param":Lorg/apache/http/message/BasicNameValuePair;
    if-lez v18, :cond_3aa

    .line 424
    const-string v37, ", "

    move-object/from16 v0, v37

    invoke-virtual {v5, v0}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 426
    :cond_3aa
    invoke-virtual/range {v25 .. v25}, Lorg/apache/http/message/BasicNameValuePair;->getName()Ljava/lang/String;

    move-result-object v20

    .line 427
    .local v20, "name":Ljava/lang/String;
    const-string v37, "nc"

    move-object/from16 v0, v37

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v37

    if-nez v37, :cond_3d2

    const-string v37, "qop"

    move-object/from16 v0, v37

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v37

    if-nez v37, :cond_3d2

    const-string v37, "algorithm"

    move-object/from16 v0, v37

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v37

    if-eqz v37, :cond_5a0

    :cond_3d2
    const/16 v22, 0x1

    .line 429
    .local v22, "noQuotes":Z
    :goto_3d4
    sget-object v38, Lorg/apache/http/message/BasicHeaderValueFormatter;->INSTANCE:Lorg/apache/http/message/BasicHeaderValueFormatter;

    if-nez v22, :cond_5a4

    const/16 v37, 0x1

    :goto_3da
    move-object/from16 v0, v38

    move-object/from16 v1, v25

    move/from16 v2, v37

    invoke-virtual {v0, v5, v1, v2}, Lorg/apache/http/message/BasicHeaderValueFormatter;->formatNameValuePair(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/NameValuePair;Z)Lorg/apache/http/util/CharArrayBuffer;

    .line 421
    add-int/lit8 v18, v18, 0x1

    goto :goto_38d

    .line 294
    .end local v5    # "buffer":Lorg/apache/http/util/CharArrayBuffer;
    .end local v9    # "digest":Ljava/lang/String;
    .end local v10    # "digestValue":Ljava/lang/String;
    .end local v11    # "digester":Ljava/security/MessageDigest;
    .end local v15    # "formatter":Ljava/util/Formatter;
    .end local v16    # "hasha1":Ljava/lang/String;
    .end local v17    # "hasha2":Ljava/lang/String;
    .end local v18    # "i":I
    .end local v20    # "name":Ljava/lang/String;
    .end local v21    # "nc":Ljava/lang/String;
    .end local v22    # "noQuotes":Z
    .end local v25    # "param":Lorg/apache/http/message/BasicNameValuePair;
    .end local v26    # "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/message/BasicNameValuePair;>;"
    .end local v27    # "pwd":Ljava/lang/String;
    .end local v32    # "sb":Ljava/lang/StringBuilder;
    .end local v34    # "uname":Ljava/lang/String;
    .restart local p2    # "request":Lorg/apache/http/HttpRequest;
    :catch_3e6
    move-exception v14

    .line 295
    .local v14, "ex":Lorg/apache/http/impl/auth/UnsupportedDigestAlgorithmException;
    new-instance v37, Lorg/apache/http/auth/AuthenticationException;

    new-instance v38, Ljava/lang/StringBuilder;

    invoke-direct/range {v38 .. v38}, Ljava/lang/StringBuilder;-><init>()V

    const-string v39, "Unsuppported digest algorithm: "

    invoke-virtual/range {v38 .. v39}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v38

    move-object/from16 v0, v38

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v38

    invoke-virtual/range {v38 .. v38}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v38

    invoke-direct/range {v37 .. v38}, Lorg/apache/http/auth/AuthenticationException;-><init>(Ljava/lang/String;)V

    throw v37

    .line 304
    .end local v14    # "ex":Lorg/apache/http/impl/auth/UnsupportedDigestAlgorithmException;
    .restart local v11    # "digester":Ljava/security/MessageDigest;
    .restart local v27    # "pwd":Ljava/lang/String;
    .restart local v34    # "uname":Ljava/lang/String;
    :cond_402
    const-wide/16 v38, 0x1

    move-wide/from16 v0, v38

    move-object/from16 v2, p0

    iput-wide v0, v2, Lorg/apache/http/impl/auth/DigestScheme;->nounceCount:J

    .line 305
    const/16 v37, 0x0

    move-object/from16 v0, v37

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/http/impl/auth/DigestScheme;->cnonce:Ljava/lang/String;

    .line 306
    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/http/impl/auth/DigestScheme;->lastNonce:Ljava/lang/String;

    goto/16 :goto_11a

    .line 335
    .restart local v15    # "formatter":Ljava/util/Formatter;
    .restart local v21    # "nc":Ljava/lang/String;
    .restart local v32    # "sb":Ljava/lang/StringBuilder;
    :cond_41a
    const/16 v37, 0x0

    move-object/from16 v0, v32

    move/from16 v1, v37

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 336
    move-object/from16 v0, v32

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const/16 v38, 0x3a

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const/16 v38, 0x3a

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 337
    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/http/impl/auth/DigestScheme;->a1:Ljava/lang/String;

    goto/16 :goto_1f8

    .line 345
    .restart local v16    # "hasha1":Ljava/lang/String;
    :cond_452
    const/16 v37, 0x1

    move/from16 v0, v28

    move/from16 v1, v37

    if-ne v0, v1, :cond_501

    .line 347
    const/4 v12, 0x0

    .line 348
    .local v12, "entity":Lorg/apache/http/HttpEntity;
    move-object/from16 v0, p2

    instance-of v0, v0, Lorg/apache/http/HttpEntityEnclosingRequest;

    move/from16 v37, v0

    if-eqz v37, :cond_469

    .line 349
    check-cast p2, Lorg/apache/http/HttpEntityEnclosingRequest;

    .end local p2    # "request":Lorg/apache/http/HttpRequest;
    invoke-interface/range {p2 .. p2}, Lorg/apache/http/HttpEntityEnclosingRequest;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v12

    .line 351
    :cond_469
    if-eqz v12, :cond_4ae

    invoke-interface {v12}, Lorg/apache/http/HttpEntity;->isRepeatable()Z

    move-result v37

    if-nez v37, :cond_4ae

    .line 353
    const-string v37, "auth"

    move-object/from16 v0, v30

    move-object/from16 v1, v37

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v37

    if-eqz v37, :cond_4a6

    .line 354
    const/16 v28, 0x2

    .line 355
    new-instance v37, Ljava/lang/StringBuilder;

    invoke-direct/range {v37 .. v37}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v37

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const/16 v38, 0x3a

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/http/impl/auth/DigestScheme;->a2:Ljava/lang/String;

    goto/16 :goto_23b

    .line 357
    :cond_4a6
    new-instance v37, Lorg/apache/http/auth/AuthenticationException;

    const-string v38, "Qop auth-int cannot be used with a non-repeatable entity"

    invoke-direct/range {v37 .. v38}, Lorg/apache/http/auth/AuthenticationException;-><init>(Ljava/lang/String;)V

    throw v37

    .line 361
    :cond_4ae
    new-instance v13, Lorg/apache/http/impl/auth/HttpEntityDigester;

    invoke-direct {v13, v11}, Lorg/apache/http/impl/auth/HttpEntityDigester;-><init>(Ljava/security/MessageDigest;)V

    .line 363
    .local v13, "entityDigester":Lorg/apache/http/impl/auth/HttpEntityDigester;
    if-eqz v12, :cond_4b8

    .line 364
    :try_start_4b5
    invoke-interface {v12, v13}, Lorg/apache/http/HttpEntity;->writeTo(Ljava/io/OutputStream;)V

    .line 366
    :cond_4b8
    invoke-virtual {v13}, Lorg/apache/http/impl/auth/HttpEntityDigester;->close()V
    :try_end_4bb
    .catch Ljava/io/IOException; {:try_start_4b5 .. :try_end_4bb} :catch_4f4

    .line 370
    new-instance v37, Ljava/lang/StringBuilder;

    invoke-direct/range {v37 .. v37}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v37

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const/16 v38, 0x3a

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const/16 v38, 0x3a

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v37

    invoke-virtual {v13}, Lorg/apache/http/impl/auth/HttpEntityDigester;->getDigest()[B

    move-result-object v38

    invoke-static/range {v38 .. v38}, Lorg/apache/http/impl/auth/DigestScheme;->encode([B)Ljava/lang/String;

    move-result-object v38

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/http/impl/auth/DigestScheme;->a2:Ljava/lang/String;

    goto/16 :goto_23b

    .line 367
    :catch_4f4
    move-exception v14

    .line 368
    .local v14, "ex":Ljava/io/IOException;
    new-instance v37, Lorg/apache/http/auth/AuthenticationException;

    const-string v38, "I/O error reading entity content"

    move-object/from16 v0, v37

    move-object/from16 v1, v38

    invoke-direct {v0, v1, v14}, Lorg/apache/http/auth/AuthenticationException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v37

    .line 373
    .end local v12    # "entity":Lorg/apache/http/HttpEntity;
    .end local v13    # "entityDigester":Lorg/apache/http/impl/auth/HttpEntityDigester;
    .end local v14    # "ex":Ljava/io/IOException;
    .restart local p2    # "request":Lorg/apache/http/HttpRequest;
    :cond_501
    new-instance v37, Ljava/lang/StringBuilder;

    invoke-direct/range {v37 .. v37}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v37

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const/16 v38, 0x3a

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/http/impl/auth/DigestScheme;->a2:Ljava/lang/String;

    goto/16 :goto_23b

    .line 386
    .end local p2    # "request":Lorg/apache/http/HttpRequest;
    .restart local v17    # "hasha2":Ljava/lang/String;
    :cond_528
    const/16 v37, 0x0

    move-object/from16 v0, v32

    move/from16 v1, v37

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 387
    move-object/from16 v0, v32

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const/16 v38, 0x3a

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const/16 v38, 0x3a

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const/16 v38, 0x3a

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/auth/DigestScheme;->cnonce:Ljava/lang/String;

    move-object/from16 v38, v0

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const/16 v38, 0x3a

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v38

    const/16 v37, 0x1

    move/from16 v0, v28

    move/from16 v1, v37

    if-ne v0, v1, :cond_590

    const-string v37, "auth-int"

    :goto_575
    move-object/from16 v0, v38

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const/16 v38, 0x3a

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 390
    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .restart local v10    # "digestValue":Ljava/lang/String;
    goto/16 :goto_283

    .line 387
    .end local v10    # "digestValue":Ljava/lang/String;
    :cond_590
    const-string v37, "auth"

    goto :goto_575

    .line 399
    .restart local v5    # "buffer":Lorg/apache/http/util/CharArrayBuffer;
    .restart local v9    # "digest":Ljava/lang/String;
    .restart local v10    # "digestValue":Ljava/lang/String;
    :cond_593
    const-string v37, "Authorization"

    move-object/from16 v0, v37

    invoke-virtual {v5, v0}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    goto/16 :goto_2a7

    .line 411
    .restart local v26    # "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/message/BasicNameValuePair;>;"
    :cond_59c
    const-string v37, "auth"

    goto/16 :goto_32b

    .line 427
    .restart local v18    # "i":I
    .restart local v20    # "name":Ljava/lang/String;
    .restart local v25    # "param":Lorg/apache/http/message/BasicNameValuePair;
    :cond_5a0
    const/16 v22, 0x0

    goto/16 :goto_3d4

    .line 429
    .restart local v22    # "noQuotes":Z
    :cond_5a4
    const/16 v37, 0x0

    goto/16 :goto_3da

    .line 431
    .end local v20    # "name":Ljava/lang/String;
    .end local v22    # "noQuotes":Z
    .end local v25    # "param":Lorg/apache/http/message/BasicNameValuePair;
    :cond_5a8
    new-instance v37, Lorg/apache/http/message/BufferedHeader;

    move-object/from16 v0, v37

    invoke-direct {v0, v5}, Lorg/apache/http/message/BufferedHeader;-><init>(Lorg/apache/http/util/CharArrayBuffer;)V

    return-object v37
.end method

.method private static createMessageDigest(Ljava/lang/String;)Ljava/security/MessageDigest;
    .registers 5
    .param p0, "digAlg"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/UnsupportedDigestAlgorithmException;
        }
    .end annotation

    .prologue
    .line 230
    :try_start_0
    invoke-static {p0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    .line 231
    :catch_5
    move-exception v0

    .line 232
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Lorg/apache/http/impl/auth/UnsupportedDigestAlgorithmException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unsupported algorithm in HTTP Digest authentication: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/http/impl/auth/UnsupportedDigestAlgorithmException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method static encode([B)Ljava/lang/String;
    .registers 8
    .param p0, "binaryData"    # [B

    .prologue
    .line 454
    array-length v4, p0

    .line 455
    .local v4, "n":I
    mul-int/lit8 v5, v4, 0x2

    new-array v0, v5, [C

    .line 456
    .local v0, "buffer":[C
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_6
    if-ge v2, v4, :cond_27

    .line 457
    aget-byte v5, p0, v2

    and-int/lit8 v3, v5, 0xf

    .line 458
    .local v3, "low":I
    aget-byte v5, p0, v2

    and-int/lit16 v5, v5, 0xf0

    shr-int/lit8 v1, v5, 0x4

    .line 459
    .local v1, "high":I
    mul-int/lit8 v5, v2, 0x2

    sget-object v6, Lorg/apache/http/impl/auth/DigestScheme;->HEXADECIMAL:[C

    aget-char v6, v6, v1

    aput-char v6, v0, v5

    .line 460
    mul-int/lit8 v5, v2, 0x2

    add-int/lit8 v5, v5, 0x1

    sget-object v6, Lorg/apache/http/impl/auth/DigestScheme;->HEXADECIMAL:[C

    aget-char v6, v6, v3

    aput-char v6, v0, v5

    .line 456
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 463
    .end local v1    # "high":I
    .end local v3    # "low":I
    :cond_27
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v0}, Ljava/lang/String;-><init>([C)V

    return-object v5
.end method


# virtual methods
.method public authenticate(Lorg/apache/http/auth/Credentials;Lorg/apache/http/HttpRequest;)Lorg/apache/http/Header;
    .registers 4
    .param p1, "credentials"    # Lorg/apache/http/auth/Credentials;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/auth/AuthenticationException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 186
    new-instance v0, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {v0}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/http/impl/auth/DigestScheme;->authenticate(Lorg/apache/http/auth/Credentials;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/Header;

    move-result-object v0

    return-object v0
.end method

.method public authenticate(Lorg/apache/http/auth/Credentials;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/Header;
    .registers 8
    .param p1, "credentials"    # Lorg/apache/http/auth/Credentials;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/auth/AuthenticationException;
        }
    .end annotation

    .prologue
    .line 209
    const-string v1, "Credentials"

    invoke-static {p1, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 210
    const-string v1, "HTTP request"

    invoke-static {p2, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 211
    const-string v1, "realm"

    invoke-virtual {p0, v1}, Lorg/apache/http/impl/auth/DigestScheme;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_1a

    .line 212
    new-instance v1, Lorg/apache/http/auth/AuthenticationException;

    const-string v2, "missing realm in challenge"

    invoke-direct {v1, v2}, Lorg/apache/http/auth/AuthenticationException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 214
    :cond_1a
    const-string v1, "nonce"

    invoke-virtual {p0, v1}, Lorg/apache/http/impl/auth/DigestScheme;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_2a

    .line 215
    new-instance v1, Lorg/apache/http/auth/AuthenticationException;

    const-string v2, "missing nonce in challenge"

    invoke-direct {v1, v2}, Lorg/apache/http/auth/AuthenticationException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 218
    :cond_2a
    invoke-virtual {p0}, Lorg/apache/http/impl/auth/DigestScheme;->getParameters()Ljava/util/Map;

    move-result-object v1

    const-string v2, "methodname"

    invoke-interface {p2}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 219
    invoke-virtual {p0}, Lorg/apache/http/impl/auth/DigestScheme;->getParameters()Ljava/util/Map;

    move-result-object v1

    const-string v2, "uri"

    invoke-interface {p2}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    const-string v1, "charset"

    invoke-virtual {p0, v1}, Lorg/apache/http/impl/auth/DigestScheme;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 221
    .local v0, "charset":Ljava/lang/String;
    if-nez v0, :cond_61

    .line 222
    invoke-virtual {p0}, Lorg/apache/http/impl/auth/DigestScheme;->getParameters()Ljava/util/Map;

    move-result-object v1

    const-string v2, "charset"

    invoke-virtual {p0, p2}, Lorg/apache/http/impl/auth/DigestScheme;->getCredentialsCharset(Lorg/apache/http/HttpRequest;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 224
    :cond_61
    invoke-direct {p0, p1, p2}, Lorg/apache/http/impl/auth/DigestScheme;->createDigestHeader(Lorg/apache/http/auth/Credentials;Lorg/apache/http/HttpRequest;)Lorg/apache/http/Header;

    move-result-object v1

    return-object v1
.end method

.method getA1()Ljava/lang/String;
    .registers 2

    .prologue
    .line 439
    iget-object v0, p0, Lorg/apache/http/impl/auth/DigestScheme;->a1:Ljava/lang/String;

    return-object v0
.end method

.method getA2()Ljava/lang/String;
    .registers 2

    .prologue
    .line 443
    iget-object v0, p0, Lorg/apache/http/impl/auth/DigestScheme;->a2:Ljava/lang/String;

    return-object v0
.end method

.method getCnonce()Ljava/lang/String;
    .registers 2

    .prologue
    .line 435
    iget-object v0, p0, Lorg/apache/http/impl/auth/DigestScheme;->cnonce:Ljava/lang/String;

    return-object v0
.end method

.method public getSchemeName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 163
    const-string v0, "digest"

    return-object v0
.end method

.method public isComplete()Z
    .registers 3

    .prologue
    .line 149
    const-string v1, "stale"

    invoke-virtual {p0, v1}, Lorg/apache/http/impl/auth/DigestScheme;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 150
    .local v0, "s":Ljava/lang/String;
    const-string v1, "true"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_10

    .line 151
    const/4 v1, 0x0

    .line 153
    :goto_f
    return v1

    :cond_10
    iget-boolean v1, p0, Lorg/apache/http/impl/auth/DigestScheme;->complete:Z

    goto :goto_f
.end method

.method public isConnectionBased()Z
    .registers 2

    .prologue
    .line 172
    const/4 v0, 0x0

    return v0
.end method

.method public overrideParamter(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 176
    invoke-virtual {p0}, Lorg/apache/http/impl/auth/DigestScheme;->getParameters()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    return-void
.end method

.method public processChallenge(Lorg/apache/http/Header;)V
    .registers 3
    .param p1, "header"    # Lorg/apache/http/Header;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/auth/MalformedChallengeException;
        }
    .end annotation

    .prologue
    .line 138
    invoke-super {p0, p1}, Lorg/apache/http/impl/auth/RFC2617Scheme;->processChallenge(Lorg/apache/http/Header;)V

    .line 139
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/http/impl/auth/DigestScheme;->complete:Z

    .line 140
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 481
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 482
    .local v0, "builder":Ljava/lang/StringBuilder;
    const-string v1, "DIGEST [complete="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lorg/apache/http/impl/auth/DigestScheme;->complete:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", nonce="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/http/impl/auth/DigestScheme;->lastNonce:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", nc="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lorg/apache/http/impl/auth/DigestScheme;->nounceCount:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 486
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
