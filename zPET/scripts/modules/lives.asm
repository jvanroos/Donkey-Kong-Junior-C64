LIVES:{


	Value: .byte 3, 3

	.label HeartCharacter = 83
	.label BlankCharacter = 32

	.label StartCharacterPosition = VIC.SCREEN_RAM + 229
	

	Reset:{

		lda Value + 1
		sta Value

		jsr Draw

		rts
	}



	LoseLife: {

		dec Value
		jsr Draw
		rts
	}

	Draw:{

		.label LivesLeft = TEMP1

		clc
		lda Value
		sta LivesLeft
		ldx #3

		//sta $d020

		
		Loop:

			
			clc
			cpx LivesLeft
		
			beq DrawHeart
			jmp DrawBlank

			DrawHeart:

			lda #HeartCharacter
			sta StartCharacterPosition, x
			lda #RED
			//sta StartColourPosition, x
			dec LivesLeft
			jmp EndLoop
			

			DrawBlank:

			lda #BlankCharacter
			sta StartCharacterPosition, x
			//inc $d020
		

		EndLoop:

			dex
			cpx #ZERO
			bne Loop
			rts


	
	}
}